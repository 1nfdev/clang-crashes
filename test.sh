#!/bin/bash

test_compiler_command() {
  compiler_command="$1"
  ${compiler_command} -o /dev/null -x c - <<< "int main() {}" 2> /dev/null
  return $?
}

clang_command=clang
# Use "clang-dev" (a clang build with assertions enabled) if available.
if test_compiler_command clang-dev; then
  clang_command=clang-dev
fi
clang_binary_with_assertions_disabled="clang"

clang_version=$(${clang_command} --version | head -1)
echo
echo "Running tests against ${clang_command} (${clang_version})"
echo "Usage: $0 [-v] [-q] [-c<columns>] [-l] [file ...]"

columns=$(tput cols)
verbose=0
log_stacks=0
delete_dupes=0
max_test_number=0
quick_mode=0
while getopts "c:vldm:q" o; do
  case ${o} in
    c)
      columns=${OPTARG}
      ;;
    v)
      verbose=1
      ;;
    l)
      log_stacks=1
      ;;
    d)
      delete_dupes=1
      ;;
    m)
      max_test_number=${OPTARG}
      ;;
    q)
      quick_mode=1
      ;;
  esac
done

shift $((OPTIND - 1))

current_max_id=$(find crashes crashes-fuzzing crashes-duplicates fixed -name "?????-*.*" | cut -f2 -d'/' | egrep '^[0-9]+\-' | sort -n | cut -f1 -d'-' | sed 's/^0*//g' | tail -1)
if [[ ${max_test_number} != 0 ]]; then
  current_max_id=${max_test_number}
fi
next_id=$(printf "%05d" $((current_max_id + 1)))
echo "Adding a new test case? The crash id to use for the next test case is ${next_id}."

color_red="\e[31m"
color_green="\e[32m"
color_bold="\e[1m"
color_normal_display="\e[0m"

show_error() {
  warning="$1"
  printf "%b" "${color_red}[Error]${color_normal_display} ${color_bold}${warning}${color_normal_display}\n"
}

duplicate_bug_ids=$(find crashes crashes-fuzzing crashes-duplicates fixed -name "?????-*.*" | cut -f2 -d/ | cut -f1 -d'.' | sort | uniq | cut -f1 -d'-' | uniq -c | sed "s/^ *//g" | egrep -v '^1 ' | cut -f2 -d" " | tr "\n" "," | sed "s/,$//g")
if [[ ${duplicate_bug_ids} != "" ]]; then
  show_error "Duplicate bug ids: ${duplicate_bug_ids}. Please re-number to avoid duplicates."
  echo
fi

test_compiler_command ${clang_command} || {
  show_error "Could not compile 'int main() {}' with ${clang_command}. Cannot run tests. Check your LLVM/clang installation."
  exit 1
}

argument_files=$*
name_size=$((columns - 20))
if [[ ${name_size} -lt 35 ]]; then
  name_size=35
fi
num_tests=0
num_crashed=0
seen_crash_hashes=""

execute_with_timeout() {
  timeout_in_seconds=$1
  command=$2
  out=$(expect -c "set echo \"-noecho\"; set timeout ${timeout_in_seconds}; spawn -noecho /bin/sh -c \"${command}\"; expect timeout { exit 1 } eof { exit 0 }" 2>&1)
  return_code=$?
  echo "${out}" | tr -d "\r"
  return ${return_code}
}

# Definition of crash uniqueness (improvements welcome!) …
# A crash is treated as non-duplicate if it has an unique "crash hash" as computed by the following crash hash function:
get_crash_hash() {
  compilation_output="$1"
  language="$2"
  normalized_stack_trace=$(egrep "0x[0-9a-f]" <<< "${compilation_output}" | egrep 'clang::' | awk '{ $1=$2=$3=""; print $0 }' | sed 's/^ *//g' | head -5)
  if [[ ${normalized_stack_trace} == "" ]]; then
    crash_hash=""
  else
    crash_hash=$(shasum <<< "${normalized_stack_trace}:${language}" | head -c10)
  fi
  echo -n "${crash_hash}"
}

test_file() {
  sdk=macosx
  path=$1
  if [[ ! -f ${path} ]]; then
    return
  fi
  language="Unknown"
  if [[ ${path} =~ \.c$ ]]; then
      language="C"
  elif [[ ${path} =~ \.cpp$ ]]; then
      language="C++"
  elif [[ ${path} =~ \.m$ ]]; then
      language="Objective-C"
  fi
  files_to_compile=${path}
  test_name=$(basename ${path})
  test_name=${test_name//-/ }
  test_name=${test_name//.cpp/}
  test_name=${test_name//.c/}
  test_name=${test_name//.m/}
  test_name="${test_name} (${language})"
  current_test_number=$(echo "${test_name}" | tr " " "\n" | egrep "^[0-9]+$" | head -1 | sed "s/^0*//g")
  if [[ ${max_test_number} != 0 && ${current_test_number} != "" && ${current_test_number} -gt ${max_test_number} ]]; then
    return
  fi
  num_tests=$((num_tests + 1))
  clang_crash=0
  compilation_comment=""
  for _ in {1..20}; do
      output=$(${clang_command} -O3 -o /dev/null ${files_to_compile} 2>&1 | strings)
      assertion=$(egrep "^Assertion" <<< "${output}")
      if [[ ${output} =~ failed\ due\ to\ signal ]]; then
          # Verify that the crash case crashes also non-assertions enabled clang binary (assumed to be named "clang").
          if [[ ${clang_command} != ${clang_binary_with_assertions_disabled} ]]; then
              output_without_assertions=$(${clang_binary_with_assertions_disabled} -O3 -o /dev/null ${files_to_compile} 2>&1 | strings)
              if [[ ${output_without_assertions} =~ failed\ due\ to\ signal ]]; then
                  clang_crash=1
              fi
          else
              clang_crash=1
          fi
          break
      fi
  done
  is_dupe=0
  hash=$(get_crash_hash "${output}" "${language}")
  if [[ ${hash} == "" ]]; then
    hash="        "
  else
    if [[ ${seen_crash_hashes} =~ ${hash} ]]; then
      is_dupe=1
    fi
    seen_crash_hashes="${seen_crash_hashes}:${hash}"
  fi
  if [[ ${clang_crash} == 1 ]]; then
    if [[ ${compilation_comment} != "" ]]; then
      test_name="${test_name} (${compilation_comment})"
    fi
    num_crashed=$((num_crashed + 1))
    adjusted_name_size=${name_size}
    if [[ ${is_dupe} == 1 ]]; then
      test_name="${test_name} (${color_bold}dupe?${color_normal_display})"
      adjusted_name_size=$((adjusted_name_size + 8))
      if [[ ${delete_dupes} == 1 ]]; then
        # shellcheck disable=SC2086
        rm ${files_to_compile}
      fi
    fi
    printf "  %b  %-${adjusted_name_size}.${adjusted_name_size}b (%-10.10b)\n" "${color_red}✘${color_normal_display}" "${test_name}" "${hash}"
  else
    printf "  %b  %-${name_size}.${name_size}b\n" "${color_green}✓${color_normal_display}" "${test_name}"
    if [[ ${delete_dupes} == 1 ]]; then
      # shellcheck disable=SC2086
      rm ${files_to_compile}
    fi
  fi
  if [[ ${verbose} == 1 ]]; then
    echo
    printf "%b" "${color_bold}Compilation output:${color_normal_display}\n"
    echo "${output}"
    echo
  fi
  # if [[ ${assertion} != "" ]]; then
  #   echo "     Assertion: ${assertion}"
  # fi
}

print_header() {
  header=$1
  echo
  printf "%b" "== ${color_bold}${header}${color_normal_display} ==\n"
  echo
}

run_tests_in_directory() {
  header=$1
  path=$2
  print_header "${header}"
  found_tests=0
  for test_path in "${path}"/*.*; do
    if [[ ${test_path} =~ README\.md ]]; then
      continue
    fi
    if [[ -h "${test_path}" ]]; then
      test_path=$(readlink "${test_path}" | cut -b4-)
    fi
    if [[ -f ${test_path} ]]; then
      found_tests=1
      test_file "${test_path}"
    fi
  done
  if [[ ${found_tests} == 0 ]]; then
    printf "  %b  %-${name_size}.${name_size}b\n" "${color_green}✓${color_normal_display}" "No tests found."
  fi
}

main() {
  if [[ ${argument_files} == "" ]]; then
    if [[ ${quick_mode} == 1 ]]; then
      print_header "Quick mode — testing only crashes triggered at unique crash locations"
      for test_file in $(find unique-crash-locations/ -type l | xargs readlink | cut -f2- -d/ | sort -t/ -k2); do
        test_file "${test_file}"
      done
      echo
      exit
    fi
    run_tests_in_directory "Currently known crashes, set #1 (human reported crashes, crashes not found by fuzzing)" "./crashes"
    run_tests_in_directory "Currently known crashes, set #2 (crashes found by fuzzing)" "./crashes-fuzzing"
    # run_tests_in_directory "Currently known crashes (duplicates)" "./crashes-duplicates"
    if [[ ${delete_dupes} == 1 ]]; then
      exit 0
    fi
    run_tests_in_directory "Crashes marked as fixed" "./fixed"
  else
    for test_path in ${argument_files}; do
      if [[ -f ${test_path} ]]; then
        found_tests=1
        test_file "${test_path}"
      fi
    done
  fi
  echo
  echo "** Results: ${num_crashed} of ${num_tests} tests crashed the compiler **"
  echo
}

main

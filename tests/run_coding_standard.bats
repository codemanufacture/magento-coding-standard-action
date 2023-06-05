#!/usr/bin/env bats

setup() {
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
    export INPUT_PHPCS_PATH="${DIR}/test_helper/phpcs"
}

teardown() {
    unset $INPUT_PHPCS_PATH
    unset $INPUT_SEVERITY
    unset $INPUT_WARNING_SEVERITY
    unset $INPUT_ERROR_SEVERITY
    unset $INPUT_IGNORE
    unset $INPUT_EXTENSIONS
    unset $INPUT_REPORT_STYLE
    unset $INPUT_PROCESSES
    unset $INPUT_STANDARD
    unset $INPUT_VERBOSITY
    unset $INPUT_IGNORE_ERRORS_ON_EXIT
    unset $INPUT_IGNORE_WARNINGS_ON_EXIT
    unset $INPUT_FILE_LIST
}

@test "Run phpcs" {
    run run_coding_standard.bash
    [[ "$output" =~ "--standard=Magento2" ]]
}

@test "Run phpcs with severity" {
    export INPUT_SEVERITY=10
    run run_coding_standard.bash
    [[ "$output" =~ "--severity=${INPUT_SEVERITY}" ]]
}

@test "Run phpcs with warning severity" {
    export INPUT_WARNING_SEVERITY=8
    run run_coding_standard.bash
    [[ "$output" =~ "--warning-severity=${INPUT_WARNING_SEVERITY}" ]]
}

@test "Run phpcs with error severity" {
    export INPUT_ERROR_SEVERITY=5
    run run_coding_standard.bash
    [[ "$output" =~ "--error-severity=${INPUT_ERROR_SEVERITY}" ]]
}

@test "Run phpcs with ignore list" {
    export INPUT_IGNORE="test/test"
    run run_coding_standard.bash
    [[ "$output" =~ "--ignore=${INPUT_IGNORE}" ]]
}

@test "Run phpcs with multiple processes" {
    export INPUT_PROCESSES=2
    run run_coding_standard.bash
    [[ "$output" =~ "--parallel=${INPUT_PROCESSES}" ]]
}

@test "Run phpcs with multiple extensions" {
    export INPUT_EXTENSIONS="php,phtml"
    run run_coding_standard.bash
    [[ "$output" =~ "--extensions=${INPUT_EXTENSIONS}" ]]
}

@test "Run phpcs with PSR12" {
    export INPUT_STANDARD="PSR12"
    run run_coding_standard.bash
    [[ "$output" =~ "--standard=${INPUT_STANDARD}" ]]
}

@test "Run phpcs with verbosity" {
    export INPUT_VERBOSITY="-vvv"
    run run_coding_standard.bash
    [[ "$output" =~ "-vvv" ]]
}

@test "Run phpcs in app/code" {
    export INPUT_FILE_LIST="app/code"
    run run_coding_standard.bash
    [[ "$output" =~ "app/code" ]]
}

@test "Run phpcs with ignore warnings on exit" {
    export INPUT_IGNORE_WARNINGS_ON_EXIT=1
    run run_coding_standard.bash
    [[ "$output" =~ "--runtime-set ignore_warnings_on_exit ${INPUT_IGNORE_WARNINGS_ON_EXIT}" ]]
}

@test "Run phpcs with ignore errors on exit" {
    export INPUT_IGNORE_ERRORS_ON_EXIT=1
    run run_coding_standard.bash
    [[ "$output" =~ "--runtime-set ignore_errors_on_exit ${INPUT_IGNORE_ERRORS_ON_EXIT}" ]]
}

@test "Run phpcs with report style" {
    export INPUT_REPORT_STYLE="summary"
    run run_coding_standard.bash
    [[ "$output" =~ "--report=${INPUT_REPORT_STYLE}" ]]
}

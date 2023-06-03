#!/usr/bin/env bash

${INPUT_PHPCS_PATH:-phpcs} \
    --parallel=${INPUT_PROCESSES:-1} \
    --runtime-set ignore_errors_on_exit ${INPUT_IGNORE_ERRORS_ON_EXIT:-0} \
    --runtime-set ignore_warnings_on_exit ${INPUT_IGNORE_WARNINGS_ON_EXIT:-0} \
    --report=${INPUT_REPORT_STYLE:-checkstyle} \
    --severity=${INPUT_SEVERITY:-8} \
    --standard=${INPUT_STANDARD:-Magento2} \
    --extensions=${INPUT_EXTENSIONS:-php} \
    ${INPUT_VERBOSITY:-} ${INPUT_DIRECTORY:-.} \
    -s $*

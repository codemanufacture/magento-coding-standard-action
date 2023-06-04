#!/usr/bin/env bash

${INPUT_PHPCS_PATH:-phpcs} \
    --parallel=${INPUT_PROCESSES:-1} \
    --runtime-set ignore_errors_on_exit ${INPUT_IGNORE_ERRORS_ON_EXIT:-0} \
    --runtime-set ignore_warnings_on_exit ${INPUT_IGNORE_WARNINGS_ON_EXIT:-0} \
    --report=${INPUT_REPORT_STYLE:-checkstyle} \
    --standard=${INPUT_STANDARD:-Magento2} \
    --extensions=${INPUT_EXTENSIONS:-php} \
    $([ -n "${INPUT_SEVERITY}" ] && echo "--severity=${INPUT_SEVERITY}") \
    $([ -n "${INPUT_WARNING_SEVERITY}" ] && echo "--warning-severity=${INPUT_WARNING_SEVERITY}") \
    $([ -n "${INPUT_ERROR_SEVERITY}" ] && echo "--error-severity=${INPUT_ERROR_SEVERITY}") \
    $([ -n "${INPUT_IGNORE}" ] && echo "--ignore=${INPUT_IGNORE}") \
    ${INPUT_VERBOSITY:-} ${INPUT_DIRECTORY:-.}

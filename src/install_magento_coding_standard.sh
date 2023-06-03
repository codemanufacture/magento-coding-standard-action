#!/usr/bin/env bash

set -eou pipefail

composer global require --no-interaction magento/magento-coding-standard:"${INPUT_MAGENTO2_STANDARD_VERSION:-*}"
composer global require --no-interaction phpcompatibility/php-compatibility:*
composer global -- exec phpcs --config-set installed_paths \
         ../../magento/magento-coding-standard/,../../phpcompatibility/php-compatibility

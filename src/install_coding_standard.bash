#!/usr/bin/env bash

CODING_STANDARD=${INPUT_CODING_STANDARD_PACKAGE:-magento/magento-coding-standard}

composer global config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true
composer global require --no-interaction ${CODING_STANDARD}:${INPUT_CODING_STANDARD_VERSION:-*}

# Fixme: find a better way to handle adding standards
if [ "${CODING_STANDARD}" = "magento/magento-coding-standard" ] ; then
    composer global -- exec phpcs --config-set installed_paths \
             ../../magento/magento-coding-standard/,../../phpcompatibility/php-compatibility
fi

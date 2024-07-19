#!/usr/bin/env bash

CODING_STANDARD=${INPUT_CODING_STANDARD_PACKAGE:-magento/magento-coding-standard}

composer global config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true
composer global require --no-interaction ${CODING_STANDARD}:${INPUT_CODING_STANDARD_VERSION:-*}

# Fixme: find a better way to handle adding standards
if [ "${CODING_STANDARD}" = "magento/magento-coding-standard" ] ; then
    INSTALL_PATHS="../../magento/magento-coding-standard/"
    if composer global show magento/php-compatibility-fork > /dev/null 2>&1; then
        INSTALL_PATHS="${INSTALL_PATHS},../../magento/php-compatibility-fork"
    fi

    if composer global show phpcompatibility/php-compatibility > /dev/null 2>&1; then
        INSTALL_PATHS="${INSTALL_PATHS},../../phpcompatibility/php-compatibility"
    fi

    composer global -- exec phpcs --config-set installed_paths "$INSTALL_PATHS"
fi

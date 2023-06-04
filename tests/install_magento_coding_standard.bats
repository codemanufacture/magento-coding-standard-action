#!/usr/bin/env bats

setup() {
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
    export COMPOSER_HOME="$BATS_TEST_TMPDIR/composer-home"
    export COMPOSE_INTERACTIVE_NO_CLI=1
    mkdir "$COMPOSER_HOME"
}

teardown() {
    rm -rf "$COMPOSER_HOME"
    unset $COMPOSER_INTERACTIVE_NO_CLI
    unset $INPUT_CODING_STANDARD_VERSION
    unset $INPUT_CODING_STANDARD_PACKAGE
}

@test "Magento coding standard is installed by default" {
    if ! command -v composer > /dev/null ; then
        skip "Composer is not installed."
    fi
    run install_coding_standard.bash
    run composer global -- exec phpcs -i
    [[ "$output" =~ "The installed coding standards are" ]]
    [[ "$output" =~ "Magento2" ]]
}

@test "Coding standard is installed with specific version" {
    if ! command -v composer > /dev/null ; then
        skip "Composer is not installed."
    fi
    export INPUT_CODING_STANDARD_VERSION=30
    run install_coding_standard.bash
    run composer global info
    [[ "$output" =~ "magento/magento-coding-standard    30" ]]
}

@test "Coding standard package is installed" {
    if ! command -v composer > /dev/null ; then
        skip "Composer is not installed."
    fi
    export INPUT_CODING_STANDARD_PACKAGE="mrm-commerce/magento-coding-standard-phpcs"
    run install_coding_standard.bash
    run composer global info
    [[ "$output" =~ "mrm-commerce/magento-coding-standard-phpcs" ]]
}

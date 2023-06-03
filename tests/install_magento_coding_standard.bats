#!/usr/bin/env bats

setup_file() {
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../src:$PATH"
    COMPOSER_HOME="$BATS_FILE_TMPDIR/composer-home"
    mkdir "$COMPOSER_HOME"
}

teardown_file() {
    rm -rf "$COMPOSER_HOME"
}

@test "Magento Coding Standard is installed" {
    if ! command -v composer > /dev/null ; then
        skip "Composer is not installed."
    fi
    run install_magento_coding_standard.sh
    echo "$output"
    run composer global -- exec phpcs -i
    [[ "$output" =~ "The installed coding standards are" ]]
    [[ "$output" =~ "Magento2" ]]
}

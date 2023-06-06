# Magento 2 Coding Standard GitHub Action

This [GitHub Action](https://github.com/actions) performs static code analysis using [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) and [Magento Coding Standard](https://github.com/magento/magento-coding-standard).

![basic workflow run](https://github.com/codemanufacture/magento-coding-standard-action/actions/workflows/basic-workflow-test.yml/badge.svg)
![automated tests](https://github.com/codemanufacture/magento-coding-standard-action/actions/workflows/test.yml/badge.svg)
![Status](https://img.shields.io/badge/maintained-yes)
[![MIT](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)

## Usage

Create `.github/workflows/coding-standard.yml` in your repository with the following contents:

```yaml
name: "Magento 2 Coding Standard"
on:
  push:
jobs:
  coding-standard:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Setup PHP with composer
      uses: shivammathur/setup-php@v2
      with:
        php-version: 8.1
        tools: composer:2.3, phpcs:3.6
    - name: Run coding standard analysis
      uses: codemanufacture/magento-coding-standard-action@v1
```

## Inputs (specify using with:)

| Option                      | Default value                   | Description                                                                                          |
|-----------------------------|---------------------------------|------------------------------------------------------------------------------------------------------|
| `standard`                  | "Magento2"                      | The name or path of the coding standard to use                                                       |
| `severity`                  | no value                        | The minimum severity required to display an error or warning                                         |
| `warning_severity`          | no value                        | The minimum severity required to display warning                                                     |
| `error_severity`            | no value                        | The minimum severity required to display error                                                       |
| `verbosity`                 | no value                        | -v Print processed files -vv Print ruleset and token output -vvv  Print sniff processing information |
| `report_style`              | "checkstyle"                    | Code Sniffer built-in reporter or a path to a custom report class                                    |
| `processes`                 | 1                               | How many files should be checked simultaneously                                                      |
| `install_magento2_standard` | true                            | Installs Magento Coding Standard when set to true                                                    |
| `coding_standard_package`   | magento/magento-coding-standard | Composer package name of coding standard to install                                                  |
| `coding_standard_version`   | "*"                             | Lastest version installed by setting "*"                                                             |
| `extensions`                | "php"                           | A comma separated list of file extensions to check                                                   |
| `phpcs_path`                | "phpcs"                         | Path to Code Sniffer binary                                                                          |
| `file_list`                 | $GITHUB_WORKSPACE               | Working directory or file list to analyse                                                            |
| `ignore_errors_on_exit`     | 0                               | Ignoring errors when generating the exit code when set to `1`                                        |
| `ignore_warnings_on_exit`   | 0                               | Ignoring warnings when generating the exit code when set to `1`                                      |
| `ignore`                    | no value                        | A comma separated list of patterns to ignore files and directories                                   |


## Goals of this actions are:

* Do one thing only - run coding standard analysis
* Provide flexibility
* Low level of maintenance
* Future proof
* Semantic versioning
* Automated tests

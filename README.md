# Magento 2 Coding Standard GitHub Action

This [GitHub Action](https://github.com/actions) performs static code analysis using [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer) and [Magento Coding Standard](https://github.com/magento/magento-coding-standard).

## Usage

Create `.github/workflows/coding-standard.yml` in your
repository with the following contents:

```yaml
name: "Magento 2 Coding Standard"
on:
  pull_request:
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
      uses: codemanufacture/magento-coding-standard-action@main
```

## Inputs (specify using with:)

| Option                      | Default value     | Description                                                                                          |
|-----------------------------|-------------------|------------------------------------------------------------------------------------------------------|
| `standard`                  | "Magento2"        | The name or path of the coding standard to use                                                       |
| `severity`                  | 8                 | The minimum severity required to display an error or warning                                         |
| `verbosity`                 | no value          | -v Print processed files -vv Print ruleset and token output -vvv  Print sniff processing information |
| `report_style`              | "checkstyle"      | Code Sniffer built-in reporter or a path to a custom report class                                    |
| `processes`                 | 1                 | How many files should be checked simultaneously                                                      |
| `install_magento2_standard` | true              | Installs Magento Coding Standard when set to true                                                    |
| `magento2_standard_version` | "*"               | Lastest version installed by setting "*"                                                             |
| `extensions`                | "php"             | A comma separated list of file extensions to check                                                   |
| `phpcs_path`                | "phpcs"           | Path to Code Sniffer binary                                                                          |
| `directory`                 | $GITHUB_WORKSPACE | Working directory where analysis is run                                                                                            |

## Motivation

There are other GitHub actions for Magento like [ExtDn Actions](https://github.com/extdn/github-actions-m2)
or [MAD-IT](https://github.com/MAD-I-T/magento-actions).

They both:
* heavily rely on docker
* require fair bit of maintenance to update docker images
* hard to track change log due to multiple actions being bundled together

Goals of this actions are:

* Do one thing only - run coding standard analysis
* Provide flexibility
* Low level of maintenance
* Future proof


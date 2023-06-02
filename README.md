# Magento 2 Coding Standard GitHub Action

This [GitHub Action](https://github.com/actions) performs static code analysis using [PHP CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer).

![Ubuntu badge](misc/badge-ubuntu.svg)

```

## Usage

Create `.github/workflows/coding-standard.yml` in your
repository with the following contents:

```yaml
name: "Magento 2 Coding Standard"
on:
  pull_request
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
        composer: 2.3
    - name: Run coding standard analysis
      uses: codemanufacture/magento-coding-standard-action
```

## Inputs (specify using with:)

| Option      | Default value | Description                                                                                          |
|-------------|---------------|------------------------------------------------------------------------------------------------------|
| `standard`  | "Magento2"    | The name or path of the coding standard to use                                                       |
|             |               |                                                                                                      |
| `severity`  | 8             |                                                                                                      |
| `verbosity` | no value      | -v Print processed files -vv Print ruleset and token output -vvv  Print sniff processing information |
|             |               |                                                                                                      |
|             |               |                                                                                                      |

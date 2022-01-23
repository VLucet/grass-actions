# GRASS Actions

This action installs GRASS.

## Inputs

* `grass-version`: Version of GRASS to install (required), one of '7_8' OR '8_0'.
* `os`: The runner OS (required), one of ????.

## Outputs

* `installed-grass-version`: The full GRASS version installed.

## Example usage

```
uses: vlucet/grass-actions/setup-grass@v1.04
with:
  grass-version: '7_8'
```
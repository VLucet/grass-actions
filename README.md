# GRASS Actions

This action installs GRASS.

## Inputs

* `grass-version`: Version of GRASS to install (required, default to '7').

## Outputs

* `installed-grass-version`: The full GRASS version installed.

## Example usage

```
uses: vlucet/grass-actions/setup-grass@v1.04
with:
  grass-version: '7'
```
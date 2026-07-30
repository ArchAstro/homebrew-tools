# Homebrew Tools

Public Homebrew tap for ArchAstro tools.

The tap installs the `archastro` and `archagent` CLIs from public release
assets in [`ArchAstro/archastro`](https://github.com/ArchAstro/archastro).

## Install

```bash
brew install ArchAstro/tools/archastro
```

## Release Update Flow

After a new CLI release is published:

1. update the corresponding formula with the new version and checksums
2. commit and push this repo
3. verify the formula with Homebrew

The scripts in `scripts/` render both formulas with release values.

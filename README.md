# Homebrew Tools

Public Homebrew tap for ArchAstro tools.

The first public formula in this repo is `archastro`, which installs the ArchAstro CLI from public GitHub release assets in `ArchAstro/archastro-cli`.

## Install

```bash
brew install ArchAstro/tools/archastro
```

## Current State

This tap is scaffolded before the first public CLI release. The formula in `Formula/archastro.rb` is intentionally a release template and must be updated with the real release version and checksums before publishing.

## Release Update Flow

After a new `archastro` release is published:

1. update `Formula/archastro.rb` with the new version and checksums
2. commit and push this repo
3. verify with `brew install ArchAstro/tools/archastro`

The helper script in `scripts/update-archastro-formula.sh` renders the formula with release values.

# Homebrew Tools

Public Homebrew tap for ArchAstro command-line tools.

## Install

```bash
brew install ArchAstro/tools/archastro
```

Scopey will be available after its first GitHub release:

```bash
brew install ArchAstro/tools/scopey
```

## Release Update Flow

The Scopey release workflow automatically runs the formula updater and pushes
the resulting version commit to this tap. `ARCHASTRO_RELEASE_GITHUB_TOKEN` must
belong to an actor allowed to bypass the tap's pull-request rule, as in the
ArchAstro CLI release workflow.

For a manual release update or recovery:

1. Download or copy the four SHA-256 values from the release's
   `checksums.txt`.
2. Run the matching helper in `scripts/` with the version followed by the
   Darwin ARM64, Darwin x64, Linux ARM64, and Linux x64 checksums.
3. Review the generated formula, open a pull request, and wait for validation.
4. After merging, verify a clean install and run the formula's version test.

For example:

```bash
scripts/update-scopey-formula.sh 0.1.0 \
  <darwin-arm64-sha> <darwin-x64-sha> <linux-arm64-sha> <linux-x64-sha>
brew install ArchAstro/tools/scopey
brew test scopey
```

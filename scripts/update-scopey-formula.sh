#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 5 ]]; then
  cat <<'EOF' >&2
Usage: update-scopey-formula.sh <version> <darwin-arm64-sha> <darwin-x64-sha> <linux-arm64-sha> <linux-x64-sha>
EOF
  exit 1
fi

VERSION="${1#v}"
DARWIN_ARM64_SHA="$2"
DARWIN_X64_SHA="$3"
LINUX_ARM64_SHA="$4"
LINUX_X64_SHA="$5"
FORMULA_PATH="$(cd "$(dirname "$0")/.." && pwd)/Formula/scopey.rb"

if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+([-.][0-9A-Za-z.-]+)?$ ]]; then
  echo "invalid version: $1" >&2
  exit 1
fi

for checksum in "$DARWIN_ARM64_SHA" "$DARWIN_X64_SHA" "$LINUX_ARM64_SHA" "$LINUX_X64_SHA"; do
  if [[ ! "$checksum" =~ ^[0-9a-f]{64}$ ]]; then
    echo "invalid SHA-256 checksum: $checksum" >&2
    exit 1
  fi
done

cat >"$FORMULA_PATH" <<EOF
class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "$VERSION"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\\d+(?:\\.\\d+)+)\$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v$VERSION/scopey-darwin-arm64.tar.gz"
      sha256 "$DARWIN_ARM64_SHA"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v$VERSION/scopey-darwin-x64.tar.gz"
      sha256 "$DARWIN_X64_SHA"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v$VERSION/scopey-linux-arm64.tar.gz"
      sha256 "$LINUX_ARM64_SHA"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v$VERSION/scopey-linux-x64.tar.gz"
      sha256 "$LINUX_X64_SHA"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end
EOF

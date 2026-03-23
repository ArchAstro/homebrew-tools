#!/usr/bin/env bash

set -euo pipefail

if [[ $# -ne 5 ]]; then
  cat <<'EOF' >&2
Usage: update-archagent-formula.sh <version> <darwin-arm64-sha> <darwin-x64-sha> <linux-arm64-sha> <linux-x64-sha>
EOF
  exit 1
fi

VERSION="$1"
DARWIN_ARM64_SHA="$2"
DARWIN_X64_SHA="$3"
LINUX_ARM64_SHA="$4"
LINUX_X64_SHA="$5"
FORMULA_PATH="$(cd "$(dirname "$0")/.." && pwd)/Formula/archagent.rb"

VERSION_TAG="$VERSION"
if [[ "$VERSION_TAG" != v* ]]; then
  VERSION_TAG="v$VERSION_TAG"
fi

cat >"$FORMULA_PATH" <<EOF
class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "${VERSION#v}"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\\d+(?:\\.\\d+)+)\$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/${VERSION_TAG}/archagent-darwin-arm64.tar.gz"
      sha256 "${DARWIN_ARM64_SHA}"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/${VERSION_TAG}/archagent-darwin-x64.tar.gz"
      sha256 "${DARWIN_X64_SHA}"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/${VERSION_TAG}/archagent-linux-arm64.tar.gz"
      sha256 "${LINUX_ARM64_SHA}"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/${VERSION_TAG}/archagent-linux-x64.tar.gz"
      sha256 "${LINUX_X64_SHA}"
    end
  end

  def install
    bin.install "archagent"
    generate_completions_from_executable(bin/"archagent", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archagent --version")
  end
end
EOF

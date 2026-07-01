class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.47.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archagent-darwin-arm64.tar.gz"
      sha256 "c2cd27f522fd7c0acffdd6d10550d0be7d21f4c804e51afbe869e80b5ea093ba"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archagent-darwin-x64.tar.gz"
      sha256 "071961c1473a42c5c0a066502fac2917f2bb07b472495a847070e88222ced050"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archagent-linux-arm64.tar.gz"
      sha256 "945ad94fe789c726fb386190eb297c5cad6004c7a63d5a0de9a694d48b7947d7"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archagent-linux-x64.tar.gz"
      sha256 "bf3ec7dd356ffca29a68269624ee1a173dee94707a94f6e7f62be9059cde3a3d"
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

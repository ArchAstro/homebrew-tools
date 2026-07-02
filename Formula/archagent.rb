class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.48.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archagent-darwin-arm64.tar.gz"
      sha256 "ddfd52b1a37e3be94d786135f595f682ab4fb31c74bb8bb3758aa6ae0dfaa856"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archagent-darwin-x64.tar.gz"
      sha256 "810285bece5630df94b291166190f3a187a0a77d34c5283ebf98b33b6c92505b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archagent-linux-arm64.tar.gz"
      sha256 "150b7831ac3771c811e9cc8e500023191093e09a4b2dc5b7661763b038c4fe85"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archagent-linux-x64.tar.gz"
      sha256 "fe3c4d421a6a9a3133ba3f7a24d9ae20936e463bfbf4d67ef3c9211d0e7b6be6"
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

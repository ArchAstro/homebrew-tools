class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.47.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archagent-darwin-arm64.tar.gz"
      sha256 "edf2ae6dac9317b8e883616d7811c341fc9fa4a1ba07431863e7332a4c89a949"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archagent-darwin-x64.tar.gz"
      sha256 "4f85407573d09f68b2dedbb4bc37f70982c089dae774ad776e5048a9258f2c37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archagent-linux-arm64.tar.gz"
      sha256 "ac4e77dc3ebbe3fb860d2a32a76b2cc59d13e2bc959d5cbfa1a0d2af0334e396"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archagent-linux-x64.tar.gz"
      sha256 "1a7321247541db613a91a41374735ad2374a8fdaa818f850dc07d97dacf87b79"
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

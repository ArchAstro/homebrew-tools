class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.22.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archagent-darwin-arm64.tar.gz"
      sha256 "5cf87947d1b923eb2a07cb6f3ccee39435c4a58274d52fa88d6f72acae53eaa9"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archagent-darwin-x64.tar.gz"
      sha256 "4d8a30d64cb47cb0fc9a3357a8d87b998cca463ba7aeb2f7d34f0ef73b458c23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archagent-linux-arm64.tar.gz"
      sha256 "0ff3a5505aabe35bb59f880f0532cd5d664b98944069fad35902d436707a7fbc"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archagent-linux-x64.tar.gz"
      sha256 "baf2786336fedb60a7aacffdb3b5874db1e41e6aa2170b45b01a0c7932bdc922"
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

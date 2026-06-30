class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archagent-darwin-arm64.tar.gz"
      sha256 "7e8afd57e78f2a4eea8d33f1902552eb2c59be9eeba26b1b3a7bf8a97ef39e63"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archagent-darwin-x64.tar.gz"
      sha256 "268234357c27ac4d9e4d3e8587d36a04d49dbe2cf1ea25e90dcb3b0898ac37b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archagent-linux-arm64.tar.gz"
      sha256 "a831f291fc90dc05dad390dcf7f3965a97708bf455ba2b8537781ff079e578d9"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archagent-linux-x64.tar.gz"
      sha256 "1e4c7f04ac84ecaf128eedb1ac855efd80d84c26d7682cca2b7d67f44a226dc6"
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

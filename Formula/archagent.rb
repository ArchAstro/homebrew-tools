class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.43.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archagent-darwin-arm64.tar.gz"
      sha256 "c3c57866a6ff7789fa637e98787cd6fca2c0ac4400a239dbbfd542e988aab783"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archagent-darwin-x64.tar.gz"
      sha256 "89273e179f7b92f3b19d5069bd9afa526f3fc2930045729c7740b1170b9bd60c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archagent-linux-arm64.tar.gz"
      sha256 "b47f6d6e109094b067be7e663d8c5fd5585e709e9609fe594fbd3793aefaef5a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archagent-linux-x64.tar.gz"
      sha256 "b3e881ce091e389e5909bf7e131ede6de793c6a20f005b4b22af7c359d4767fe"
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

class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.21.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archagent-darwin-arm64.tar.gz"
      sha256 "e0a7f1c4fe614824a4ffb212773f706250389ab774cae4f7c602ea6a672466ac"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archagent-darwin-x64.tar.gz"
      sha256 "2eca9003675653832ed2c7c0a9a2f2cfceb6cb2a743b7c16d21d89f14d1591ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archagent-linux-arm64.tar.gz"
      sha256 "f5b7847201407059bde7012c4455c1b85edb9d5c794279b76b824c0ea9168449"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archagent-linux-x64.tar.gz"
      sha256 "fb5d5d14072f302dc83caee3e665aaaf21c755ca6bc1d34e3147f9d610d0aa42"
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

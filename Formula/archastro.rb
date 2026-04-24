class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.28.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archastro-darwin-arm64.tar.gz"
      sha256 "a190f1f8333b7d31cd0999d9b267aa8a874676714bf2aa468520092bf893fab0"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archastro-darwin-x64.tar.gz"
      sha256 "6d19512efd09b073cc9b54ddf6b74cf498ed2bce09d601371b44bc151bf6216b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archastro-linux-arm64.tar.gz"
      sha256 "aa5bd17f71caf199dfe18f3eb92e6b2c4330939b0ea84a1b36aaeb7d57763cea"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archastro-linux-x64.tar.gz"
      sha256 "b72a383ee7450fa23b9ea3c1b02545f5f21279ad28cf1f62cafa0c1a3487c0a3"
    end
  end

  def install
    bin.install "archastro"
    generate_completions_from_executable(bin/"archastro", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archastro --version")
  end
end

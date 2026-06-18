class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.41.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archagent-darwin-arm64.tar.gz"
      sha256 "a9adabd9d9f5c8317cbde00ad15989d5bfce4ac839d2d0c00b55cb650e88de79"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archagent-darwin-x64.tar.gz"
      sha256 "399e1640492665f1754b90fbfd5f4c71e78d4afecf4afea4439ad36ace63c80d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archagent-linux-arm64.tar.gz"
      sha256 "b061efd94a5df987d5b74d617d63bfc7d72b78d68d14729e84aba919d983d341"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archagent-linux-x64.tar.gz"
      sha256 "3e14b730b9022786db12d51afe23a54ef447f421768446ecd52c55764af2af08"
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

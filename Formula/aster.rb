class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.16.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.16.0/aster-darwin-arm64.tar.gz"
      sha256 "58759e917622ce27d07ad516b69bc14100b8152a9dffd59a74f6d4f2a62d6a93"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.16.0/aster-darwin-x64.tar.gz"
      sha256 "052be9a0a00b9d597f41569ad47a68dad17113004e3601dba531a7db2be0a07d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.16.0/aster-linux-x64.tar.gz"
      sha256 "a9d633018a4b3edbff84619d7b3b92822eea55b6e0c1be7b1d6df33f8247e789"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

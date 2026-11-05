class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.31.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.0/aster-darwin-arm64.tar.gz"
      sha256 "f02434997c7ef788df3fd4e2a6ad6338034ef68f39a66863c9395506ff1676f1"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.0/aster-darwin-x64.tar.gz"
      sha256 "c58a8318243a10ce37e27cd615bb7a6dbc0329d9174c093c83337990344f1749"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.0/aster-linux-x64.tar.gz"
      sha256 "89d4cee8bc993fbae86bc4c28ab06a646d64a88fd33233dedf6381235a6b1d7b"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

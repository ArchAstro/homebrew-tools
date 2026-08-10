class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.10.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.1/aster-darwin-arm64.tar.gz"
      sha256 "c93a70e628a93c6c7d77d014a0852b76c45c3eb4ab3233179430daf46d5a8899"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.1/aster-darwin-x64.tar.gz"
      sha256 "25aedee273dca61f79ffe2c4577cb8b93bf7e53f3a11ee9df65b01dfd90eb2c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.1/aster-linux-x64.tar.gz"
      sha256 "3ac5268a1adecb5481cefa73d322df07ace150b3ac4ec875758c99e909f65b0a"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

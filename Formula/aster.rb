class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.11.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.2/aster-darwin-arm64.tar.gz"
      sha256 "72c12d706a3267148e669c07869a7983ceab1a34dbbb8aeefd17da08dc2af74a"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.2/aster-darwin-x64.tar.gz"
      sha256 "0f2d5186fa259a215e3963620df98365be2b0f88da159c83a0d2b1fdeeba8249"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.2/aster-linux-x64.tar.gz"
      sha256 "5559d2d6e00ce81bdc3f7ae126f2caa9a02c4e97171c726572d947daffe6a821"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

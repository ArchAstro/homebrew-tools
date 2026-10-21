class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.22.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.22.0/aster-darwin-arm64.tar.gz"
      sha256 "93ed1f690df7f51925f0de82ac205bd54cf4d0e6a7d4977ab8642576dbfe704f"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.22.0/aster-darwin-x64.tar.gz"
      sha256 "77638eed13551bbe2f94614a0cc7f78302d3846ffedfaee154344cd4a003c66e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.22.0/aster-linux-x64.tar.gz"
      sha256 "30347ce27339c121f325994efb5155abca7151ba50025605e5310e3f4732655a"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

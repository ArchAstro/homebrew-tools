class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.37.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.1/aster-darwin-arm64.tar.gz"
      sha256 "1c2649b5accdaf5b792f270265c54b8b739be095e08ca75c324e16acaf3523ef"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.1/aster-darwin-x64.tar.gz"
      sha256 "61c857658f254ed0fedd394744c239945f166b58c5e8a1da69ea5ac00fc7444b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.1/aster-linux-x64.tar.gz"
      sha256 "139d28abf5a3a80cbb558280f598db81a3d938cacf04b234b6d66e5741440690"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.10.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.0/aster-darwin-arm64.tar.gz"
      sha256 "f035ac0270686747f042dabff5d7768acab0e91c79c01d4c71c09eeeea4fbf9a"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.0/aster-darwin-x64.tar.gz"
      sha256 "dbc6a2ac8624b3216caaa23ce871c1ac53ae727345bdea4c21ed3fd085d017b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.0/aster-linux-x64.tar.gz"
      sha256 "134014b22a14f405e67b4c311a0c7f934a4e2f08ba85a9c4a7ee05ca7933ba4e"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

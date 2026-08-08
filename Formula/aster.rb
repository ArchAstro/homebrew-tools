class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.9.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.9.0/aster-darwin-arm64.tar.gz"
      sha256 "ae1fb28a4e3fe357073aeaf06bf545145bdc3f469426d518f0a7aa8303c69d10"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.9.0/aster-darwin-x64.tar.gz"
      sha256 "8a347ed8b3d947859a28f8fb6f624d69e13f923d255ba7fccd750afa8d2d0de5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.9.0/aster-linux-x64.tar.gz"
      sha256 "e2ff83e3a80d1e090f522a83ff8717722d012c312211bd64c24099f6b7f90833"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

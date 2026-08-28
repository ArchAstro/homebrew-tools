class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.14.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.14.1/aster-darwin-arm64.tar.gz"
      sha256 "f84721334a27ed242e05b7f6f78867594ce1ea3c54b39dac0e2d0f41f1e5325c"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.14.1/aster-darwin-x64.tar.gz"
      sha256 "2d20be979640c9011dc4b72ec5ec65f3756efd28b5f4e7aad15a7c2445a768b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.14.1/aster-linux-x64.tar.gz"
      sha256 "2b1c5f4aef776292eb042751b1aaf0170488067ad5f793eefbe0d0f15982350a"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

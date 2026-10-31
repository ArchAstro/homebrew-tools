class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.30.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.0/aster-darwin-arm64.tar.gz"
      sha256 "21bcfd9323bfe97df9b5a5e9a19753fce75ae6722f74bf119cab3ceb20adf17a"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.0/aster-darwin-x64.tar.gz"
      sha256 "9c1e72d8cd5bcdfcd872ef762312834d3f667c992a997d317b35f962d8656949"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.0/aster-linux-x64.tar.gz"
      sha256 "60dc631b25cd1a4931c13cc7261576dece6e5b56b1cbdbc8809b9b3a57ac9d11"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

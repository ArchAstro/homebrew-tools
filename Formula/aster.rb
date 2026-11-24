class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.36.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.36.0/aster-darwin-arm64.tar.gz"
      sha256 "78cc5d76d475c0486e3d7a1173ff74fa8ebeebe0597f5fef46fa3b52d4a501fc"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.36.0/aster-darwin-x64.tar.gz"
      sha256 "1263a8d850d8926807d6c57c4acf70b27ec173a7023a9e3fa155f600cc58759d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.36.0/aster-linux-x64.tar.gz"
      sha256 "3dd87671e4b2143994c6790d3d622cbaf8aaabe2b91e242cbaed96ea34dce2a3"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

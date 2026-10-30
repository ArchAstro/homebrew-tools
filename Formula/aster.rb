class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.27.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.27.1/aster-darwin-arm64.tar.gz"
      sha256 "f3e262ef3b054e7502c4ac4e4def085cb04f8c5af50b6e348e5b88ee8ccc2c2d"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.27.1/aster-darwin-x64.tar.gz"
      sha256 "0891a74d466a3d01c2efbee45407335580bb5388dd635aa7fe6ab214afa01145"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.27.1/aster-linux-x64.tar.gz"
      sha256 "a67eee738a6b86b803ed8ee7473351e4ce6869b20d16b56afe7dff4df3577048"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

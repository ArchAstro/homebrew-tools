class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.21.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.21.0/aster-darwin-arm64.tar.gz"
      sha256 "a79dfe910885337b2207b7a6dbf51bb78dd3fb6f5733d797314a3fe4fc607ae4"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.21.0/aster-darwin-x64.tar.gz"
      sha256 "51f2cbb60af9721dd215aa58e9bca9e4730e51ea92dd9ca97d75acb12f4eefed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.21.0/aster-linux-x64.tar.gz"
      sha256 "0bf1669e8df679780dddcda2eb1330b347738a2cb42cb384b2ca14652278a402"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

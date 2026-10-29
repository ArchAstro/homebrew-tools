class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.27.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.27.0/aster-darwin-arm64.tar.gz"
      sha256 "11554880028bc51aecd5d83c470fa260e01afd5b1cd0330d1fd29da016d82711"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.27.0/aster-darwin-x64.tar.gz"
      sha256 "74cc5ad97b4cd035466e67b885e9a1050c538dd476dda6736f25b3a98eb41acf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.27.0/aster-linux-x64.tar.gz"
      sha256 "a746dd00ee78d2d0ff495b46801761cd11f7d1cff17e2f8a48abc6fde28f3a8e"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

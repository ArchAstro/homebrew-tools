class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.25.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.25.1/aster-darwin-arm64.tar.gz"
      sha256 "c6102ede0bc66208d19c809b0d9cd3c6b926ff994da4663549ec4dc011139379"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.25.1/aster-darwin-x64.tar.gz"
      sha256 "a9c69c19c27d347b982e47be6ec0aa31fe1da9c0c40c5388ca16f2c61b1d09f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.25.1/aster-linux-x64.tar.gz"
      sha256 "368620a1717ffe266fa156c335d508042fbe039b19e9551133b413385cc37bd6"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

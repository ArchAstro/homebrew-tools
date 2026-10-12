class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.17.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.2/aster-darwin-arm64.tar.gz"
      sha256 "7d3118756168d3e345dcb00778332d450a950e4e3202df0622b5e7a42a48a9d8"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.2/aster-darwin-x64.tar.gz"
      sha256 "1b10a85454ee5f90cee4ae4c6d864c43dce0f61946ccda0c2943df6ea43baeb4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.2/aster-linux-x64.tar.gz"
      sha256 "9ddc0abee4bd797cb47aaae7c65786dd24629f0c804f6a4665f7a46012643e6d"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

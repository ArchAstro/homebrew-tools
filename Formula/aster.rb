class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.29.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.29.0/aster-darwin-arm64.tar.gz"
      sha256 "f168a92d3e8645d65ed8b20e346a760c820370be537e0f6f062e571aaab0abb0"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.29.0/aster-darwin-x64.tar.gz"
      sha256 "7d05004e97eb157271f3010481dda31023a0c54171691328576a580706eb6a6a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.29.0/aster-linux-x64.tar.gz"
      sha256 "edf669376c336f1f727658885f519113fd115b760eaca289737d05b41b6df9b1"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

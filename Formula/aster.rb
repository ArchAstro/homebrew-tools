class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.24.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.3/aster-darwin-arm64.tar.gz"
      sha256 "dc79abcfad421b0beafd0c3da31135da06b98f8d797a0faa666fbb99c8ad601b"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.3/aster-darwin-x64.tar.gz"
      sha256 "52583d3f3499c27241619a7279706bfc0c18dad6bab5a2482f5934d44673f5a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.3/aster-linux-x64.tar.gz"
      sha256 "aa7654d5abdadb8b1570a7a92c17c8fac226460c973ad61d087957527aaf8bab"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

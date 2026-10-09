class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.17.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.1/aster-darwin-arm64.tar.gz"
      sha256 "c0953c96e62479348f7e661d7197508dc51ab3aa85e5e5977dcb2285925f97a3"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.1/aster-darwin-x64.tar.gz"
      sha256 "ddb1a59e6080a7e8e56055015612df062ed2de0c7390639f29f147f3a7397404"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.1/aster-linux-x64.tar.gz"
      sha256 "1eabb1bdc5cfcf9b12803fafd4953f9463eba08fdadf5dc41554473b2236c478"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

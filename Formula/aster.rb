class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.32.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.32.0/aster-darwin-arm64.tar.gz"
      sha256 "ed4c79939524d52c4ca5cbadb4cff45778d3d7bc0ec7fad6cb5d3c12143bc981"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.32.0/aster-darwin-x64.tar.gz"
      sha256 "9de4e5049dbbd0d5c3d59a57c0af91f9cf3cb1fc2732c5ffdabbc286f4d7a8f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.32.0/aster-linux-x64.tar.gz"
      sha256 "b4844ff5a93880c4cd2246d15c6f776ba53a73c86fea12051b1e43fffad1aee7"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.37.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.0/aster-darwin-arm64.tar.gz"
      sha256 "c82b968140c8686d42e123791734d6d7d6599700bb38c858bde85079082655eb"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.0/aster-darwin-x64.tar.gz"
      sha256 "879e852cd80c3187079286268024417d29b95b618356821f1a7de4edd8029664"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.0/aster-linux-x64.tar.gz"
      sha256 "cd9963a822f98cfbad7d363b0a587db6266663804e43de5ef8b6115122cf70ef"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.35.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.35.1/aster-darwin-arm64.tar.gz"
      sha256 "bdca5580496895510f5cd5e4cef52c860af3a354d64e0691ddfab7d538c6f77e"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.35.1/aster-darwin-x64.tar.gz"
      sha256 "595f51221cdb1f00ab667d8331119bc3fab2dce5faac00afa3eacb6bebf8bb53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.35.1/aster-linux-x64.tar.gz"
      sha256 "ca82152f35bbe9985c4860996a6ad78e471ba4dbd5301de3c08ab717e744969a"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

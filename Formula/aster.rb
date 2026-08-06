class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.8.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.8.0/aster-darwin-arm64.tar.gz"
      sha256 "b826cebd0cf7c0d7ef9160d4ed3650944e18445e7580f1a9ae164b9006e31998"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.8.0/aster-darwin-x64.tar.gz"
      sha256 "f6ccc8ede39316077c4e6eb796229fa7a5bdd5179c310a8f6379ed5754f69d08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.8.0/aster-linux-x64.tar.gz"
      sha256 "259b5bdf04c1e52e58209f5ba01741de4e6ee16268ea563a3ca60f2b892d36bf"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.18.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.18.1/aster-darwin-arm64.tar.gz"
      sha256 "27a11fe0ca43fcc5fd36ee8494cc68509ea73f68eb1f4a7e9db478caaa2ae737"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.18.1/aster-darwin-x64.tar.gz"
      sha256 "c1abe80d2efb8d7b48562f12c485cd87218bc8bcd154a5545f3a07f392da638e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.18.1/aster-linux-x64.tar.gz"
      sha256 "f5b16daf3ea08059d36c3d643295a7aff22e7a7aa9b15baf9bfe1f3582d177be"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

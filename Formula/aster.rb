class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.33.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.33.0/aster-darwin-arm64.tar.gz"
      sha256 "4478a41f5e691e58c974839e4292f25dbfdb8a7821a6c36c668e4199caadd557"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.33.0/aster-darwin-x64.tar.gz"
      sha256 "c6f1f10d4d8c0601dab0f0fb1a7b04fbf64f5f5be9f22bcb225b51aad5559281"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.33.0/aster-linux-x64.tar.gz"
      sha256 "5ba510a05c02969ab5ecd8cd20579f57e982d5e8123219040384b1b7c4338809"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

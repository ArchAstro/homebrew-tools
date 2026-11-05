class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.31.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.1/aster-darwin-arm64.tar.gz"
      sha256 "36919d80c186ef734e6a168b1beb9bb352c62c5f1427295c89af59a5633b5314"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.1/aster-darwin-x64.tar.gz"
      sha256 "b06f1cc12b0105c3e6f94a0a2c5f3475a83d49546252c8f7b417a365cb26b6d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.1/aster-linux-x64.tar.gz"
      sha256 "ddcef6e18bbc7e907001ffcf049ad3cee49fdd5466d039e4c66b138538259542"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

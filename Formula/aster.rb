class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.25.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.25.0/aster-darwin-arm64.tar.gz"
      sha256 "b661c3534e607e058d2a233e23e6fb7cb09d1a3f2bb1252fd4aac159c302e032"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.25.0/aster-darwin-x64.tar.gz"
      sha256 "e5058d6da99e152e00ca316d30b12fd99f4063fd07b6faf0cb97c63f6439da2e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.25.0/aster-linux-x64.tar.gz"
      sha256 "b5b09e5855efd2fbcc48097d1de88e230bd5067f2edbbf38ed0d7441179451c5"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

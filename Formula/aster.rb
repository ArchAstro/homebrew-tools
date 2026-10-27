class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.24.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.2/aster-darwin-arm64.tar.gz"
      sha256 "4196bea093f07b2cc834c146a65d9dbd123cd3e4099c456ad43ce01cadda7300"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.2/aster-darwin-x64.tar.gz"
      sha256 "a8871bbdb40179e7cad46d9f98ab225ed973375012aaa2adc084df8cb139b5b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.2/aster-linux-x64.tar.gz"
      sha256 "9d8f6ae39642e0f966ea4d4db52ac72ba9346b0a93a10c9dcc2bbe333eed636d"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

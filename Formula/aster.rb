class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.20.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.20.0/aster-darwin-arm64.tar.gz"
      sha256 "bb571828e2b9e8d6f2555191f8e34fec356eb49ccf7de7b41e3fb4f403a6ec32"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.20.0/aster-darwin-x64.tar.gz"
      sha256 "0f8a0c1f065b530367b10b702f4ce5010835890c0d46707743baf23eb8fd6662"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.20.0/aster-linux-x64.tar.gz"
      sha256 "1d59408c9586c9eeced55ffcc3cad7157ad2fef8f8807249ca8491abbe234dbb"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

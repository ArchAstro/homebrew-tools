class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.35.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.35.0/aster-darwin-arm64.tar.gz"
      sha256 "993619150f31f09ed3a2d5b2a94132f10a95b2a1973e58fab1db5a963a950723"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.35.0/aster-darwin-x64.tar.gz"
      sha256 "cf68aa21dba2333e6084ed3bc30f0e14ef5149f53e513849e8b0405342c84c0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.35.0/aster-linux-x64.tar.gz"
      sha256 "f5c0915324455ef40379ad1c0efa9be773c629565480a44beb617e2538e9391a"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

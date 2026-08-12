class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.11.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.0/aster-darwin-arm64.tar.gz"
      sha256 "9013cedcbcff5747cafad0a6df9bec8e182d384ce8de101a4472e8be08503f1d"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.0/aster-darwin-x64.tar.gz"
      sha256 "e508a953ab21827ae43425a4bd47ac3c578e645dc9da214f3c5be7c6950f38de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.0/aster-linux-x64.tar.gz"
      sha256 "dd9510cf3541ce45431976cbcb4a371a2579479939942819c98d666ccf31a78b"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

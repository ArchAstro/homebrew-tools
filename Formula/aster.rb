class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.14.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.14.0/aster-darwin-arm64.tar.gz"
      sha256 "79ba0fd9fc494a9c5a62ddc8401303c1daf39fa2994bf8fbb0b7aa0daf516bda"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.14.0/aster-darwin-x64.tar.gz"
      sha256 "cf61835f044367b4899011486e615bb2205b8d17fa7646fe9188ea85e83b15f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.14.0/aster-linux-x64.tar.gz"
      sha256 "1149131c6b1c8267e50145056a69d3047035a78622ba9f39a922e216b2ace5d1"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

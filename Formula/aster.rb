class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.19.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.19.0/aster-darwin-arm64.tar.gz"
      sha256 "f964dc7f1718906d0c3a7b5f24a3702720ba5aef0da1eede8aeeb592bde2770a"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.19.0/aster-darwin-x64.tar.gz"
      sha256 "8a32c389b94eeb7f694d75abbf69bff5ccefdb7e6bcd4bd03cca0e7ab6c95005"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.19.0/aster-linux-x64.tar.gz"
      sha256 "f1804f5ebc65c4209539bcb8cfc87338410d77db1f2c6c2a53c73da30e49ad0f"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

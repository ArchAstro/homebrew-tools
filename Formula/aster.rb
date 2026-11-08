class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.31.6"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.6/aster-darwin-arm64.tar.gz"
      sha256 "202edfd9344db243d58b4fa19ca3f1df96e8473aa32ced75526b213960301a20"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.6/aster-darwin-x64.tar.gz"
      sha256 "f598df4c3d17eb6bfcf482296e864cbb15250c8144297feb1e5687d523c40d98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.6/aster-linux-x64.tar.gz"
      sha256 "e3fce258519214710051def078c7115ce220bcd8da7c4daf3379bffec3c1068b"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

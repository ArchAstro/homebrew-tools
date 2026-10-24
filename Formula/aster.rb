class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.24.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.1/aster-darwin-arm64.tar.gz"
      sha256 "f57020098af73e848bd8c56a476454b0396d0732e07e0044061ffa80f178fd98"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.1/aster-darwin-x64.tar.gz"
      sha256 "ed6d71cf182ad5620d362a08f87ad153d5aa395bd7328f44d780b71344f9c670"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.1/aster-linux-x64.tar.gz"
      sha256 "a7dc4ac7131e8e2ff523b411059c7ca780195c8bb40a6dd2bc9c33b485eb5ef5"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

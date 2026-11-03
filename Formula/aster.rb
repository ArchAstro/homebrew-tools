class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.30.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.2/aster-darwin-arm64.tar.gz"
      sha256 "0b053c0585b4919c61ef60a214e7c281ea19616e9de88a09b3dd670c8dc4c518"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.2/aster-darwin-x64.tar.gz"
      sha256 "6067f9aaa30beff1e9b94e0fd1cba930c1d764da50a0785cf67e99d2c3c6c583"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.2/aster-linux-x64.tar.gz"
      sha256 "3851d1488c1a6c07c7b9d841411836a21e14de98464a57258128a802a8c3621c"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

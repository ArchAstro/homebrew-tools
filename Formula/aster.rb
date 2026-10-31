class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.30.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.1/aster-darwin-arm64.tar.gz"
      sha256 "0f69a968f6f2a9266238eb99510bef9baaa503da6c422b6004aec80d73e0b218"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.1/aster-darwin-x64.tar.gz"
      sha256 "3eb4a74f7fe466be8b2bff75b2b417069d025440a5f6d9f966165e9bbd35c5a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.1/aster-linux-x64.tar.gz"
      sha256 "3746035b33f915ed983a463dc0841d1be881cd3d9bfce52814451c5c4263ed70"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

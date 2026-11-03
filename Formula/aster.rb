class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.30.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.3/aster-darwin-arm64.tar.gz"
      sha256 "1ad3cd5943bb6e815bbc2ef6b349a7e2a9834bb9b321b2551c6742b59deec979"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.3/aster-darwin-x64.tar.gz"
      sha256 "bc9b8b6e790f74465fda67e2f61cc9e908dc6d1a675b922e8fcaf30d0d420c99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.3/aster-linux-x64.tar.gz"
      sha256 "40ae029e8b578e6d6d15778584176bab0976829f304b9e862e9276c0be65a0e9"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

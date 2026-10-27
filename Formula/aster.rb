class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.24.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.4/aster-darwin-arm64.tar.gz"
      sha256 "eaf66ce2cdb4d94a008e77ed0b576cfe09cff4525dc559fda91ced9442e220d2"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.4/aster-darwin-x64.tar.gz"
      sha256 "bf239254b6c4221328e6af4d7d6f457d34d396e8863ee76eafb285299d525fd0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.4/aster-linux-x64.tar.gz"
      sha256 "9a2f7182de2e450a14c53c82b25857a31596d8c4598fbac72a200aba739d5f7c"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

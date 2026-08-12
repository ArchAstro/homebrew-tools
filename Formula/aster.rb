class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.11.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.1/aster-darwin-arm64.tar.gz"
      sha256 "6be70450789bc6796cd824b60edd02b42cb2d0f2dfe58888b32e1a8a64f81951"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.1/aster-darwin-x64.tar.gz"
      sha256 "749c9ac1bd33b88b0561dea593bca4e27e08bcc598b26701ac9d6ca7c9cf4e49"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.11.1/aster-linux-x64.tar.gz"
      sha256 "6abd29fdd14db73ce257348671e7b9f04e4ccef64ff5acacf3ee931b0e0c1886"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

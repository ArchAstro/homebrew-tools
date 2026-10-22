class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.23.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.23.1/aster-darwin-arm64.tar.gz"
      sha256 "60cf5f08411f9f2ee8d7cd134c245de2d516e9897cee25ae78e183f31d9f6526"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.23.1/aster-darwin-x64.tar.gz"
      sha256 "ffb53685657b82ef437e256ef719ae02f0c74e621ece3e53f275b2cade6e94da"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.23.1/aster-linux-x64.tar.gz"
      sha256 "75e79ecfdd9a61674f4d2be33feab25cff0e456d973240e32482b7c7310c4ab1"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

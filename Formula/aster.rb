class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.34.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.34.0/aster-darwin-arm64.tar.gz"
      sha256 "416dcc7ff513403f684f1bc06d37dcd09d1a963e3c9d82000e3a806b63bd74ea"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.34.0/aster-darwin-x64.tar.gz"
      sha256 "76a2a4bef1df48591116cf7b34a67fa4e111340b58b467b8ab23d38d7b403596"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.34.0/aster-linux-x64.tar.gz"
      sha256 "22bbeb0995fd3c8055cf475d51b680ea4aa226d52f1989fdcd33253689a2e62b"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.31.5"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.5/aster-darwin-arm64.tar.gz"
      sha256 "9ff1af9a19b076c16eda1409df5dacb99d74904a9972e7aec1d17c8e638b55fb"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.5/aster-darwin-x64.tar.gz"
      sha256 "b104706313d0e434b606fbdb9868887e093d04ff4cfbd4e6d8302114be3ef479"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.5/aster-linux-x64.tar.gz"
      sha256 "0c7e6f341b9feaaaf6584382aa4ae2e4798619ecfd680e7a469c7098905e6745"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

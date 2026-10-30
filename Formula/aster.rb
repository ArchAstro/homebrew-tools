class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.28.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.28.0/aster-darwin-arm64.tar.gz"
      sha256 "c68b997d3ff9dcd8b39de62f07352d40f1bfc787469941539445d610f548ab5f"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.28.0/aster-darwin-x64.tar.gz"
      sha256 "c541727d8414f8a71221c4d0a822920345bb524bf0f63ccf7bbf62af8181751e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.28.0/aster-linux-x64.tar.gz"
      sha256 "f03714515987dc7fd3a045be1fd5886ea51888ace20cc537203d6abb3d8bb7aa"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

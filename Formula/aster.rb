class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.26.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.26.0/aster-darwin-arm64.tar.gz"
      sha256 "bc0ee56731f6a901d81f7f30e03d75cd4d11f64cabbb443ad27686b939b1aea9"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.26.0/aster-darwin-x64.tar.gz"
      sha256 "d3255756e38883ceb67aecbb6683670c08d2f26b68bda6d8b8375bfcdc72879a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.26.0/aster-linux-x64.tar.gz"
      sha256 "04572387aefcca4d9a92bdf4f309601de129fd7a4c9984663664ebaae6fb5809"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

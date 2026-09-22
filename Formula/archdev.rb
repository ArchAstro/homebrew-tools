class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.1/archdev-darwin-arm64.tar.gz"
      sha256 "f143a9495c76984ae6fdc09184a09ba46ec54dda68174d2b51e3dbc67d12d608"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.1/archdev-darwin-x64.tar.gz"
      sha256 "da6427d8d290a892319e8cfe12530712af3c63fb50c7c45288c7ce5a77bb740a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.1/archdev-linux-arm64.tar.gz"
      sha256 "d4204596a500ed31a000f3c6a62a0dbbb8a4c57112669b420ed98b3b3053a3af"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.1/archdev-linux-x64.tar.gz"
      sha256 "1312794ab649decd8c902eda0fd540a193c44479613512d5c6206bc1c26e7f1a"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.43.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.2/archdev-darwin-arm64.tar.gz"
      sha256 "5b32cd480db8d75e4ae265ec64254289f5ecc2c74902564542880c1dc29f74ce"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.2/archdev-darwin-x64.tar.gz"
      sha256 "bcb1b65e17ea9df4b0cc6c5d617198587bfe1456abd83ece34eb423823639960"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.2/archdev-linux-arm64.tar.gz"
      sha256 "6e669347c6aca1a91c2ff1882d7ffcdcfb9d4fc7d5750ebdd246042d6456b342"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.2/archdev-linux-x64.tar.gz"
      sha256 "608aaa1be3272736b4f383ed81efa29528de1f77d6deeeb1ed5df35bb9a17b25"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

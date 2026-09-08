class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.35.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.0/archdev-darwin-arm64.tar.gz"
      sha256 "2b0e938ddf24e807f3da721e8d1e86444aade13a11d5661de0dc3e65d0e84d2d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.0/archdev-darwin-x64.tar.gz"
      sha256 "dafc153c3e854a84e4eb450b7d788c944964d85a71b0b4538e967d758f3c99da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.0/archdev-linux-arm64.tar.gz"
      sha256 "0b3a9a582e29c4298e061cca42fbb7b21386a6c4f4ee8c1c9dd5a7ed5959ed22"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.0/archdev-linux-x64.tar.gz"
      sha256 "bcb92c4c4a0b6ad72106d9f67f7ed2cace7b09e3ebae8aa1169a3d6446035517"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

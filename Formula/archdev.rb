class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.8"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.8/archdev-darwin-arm64.tar.gz"
      sha256 "2944465cdf4c4384bf2050cdeb932221f7dad35d0fd1bfc69dacd8ad0d3023f6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.8/archdev-darwin-x64.tar.gz"
      sha256 "8624888c0c1f2db91cce49d256d77c519c5929f8166b02f3109cde21c4cff98a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.8/archdev-linux-arm64.tar.gz"
      sha256 "282c3a25b3e1ce825379327fff4ea60933022e29ed547b299e751008e4e8f8d4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.8/archdev-linux-x64.tar.gz"
      sha256 "5de969bcecd939481e8c0ca92ec873f65ebe85a7722d73bd323320765c118144"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

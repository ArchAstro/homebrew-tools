class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.35.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.6/archdev-darwin-arm64.tar.gz"
      sha256 "a19990ed45d422a8e976326d05344b18d23f0dda48a58a1235ad358b60c99a7d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.6/archdev-darwin-x64.tar.gz"
      sha256 "6fa65e2097c9d260fee94c7255acadd20910c44cfcb1775c87f2686788dbd640"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.6/archdev-linux-arm64.tar.gz"
      sha256 "1e303538a4715003d33447adf4ddc98fc556db0cd91df6fa7e93906d7ad22bf2"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.6/archdev-linux-x64.tar.gz"
      sha256 "114b93f711d1fab300873505b30c938433d9bd163f8342d486fee370ea63a9ec"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

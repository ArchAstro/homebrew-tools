class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.1/archdev-darwin-arm64.tar.gz"
      sha256 "245bc009843fca1c5189acc490eed88628281ad2cafa98699138d2fef20e3313"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.1/archdev-darwin-x64.tar.gz"
      sha256 "afe502057f1e8c69a57faaf7f063201a2c5282a8ef660fe6febe27372a698359"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.1/archdev-linux-arm64.tar.gz"
      sha256 "407593864ff5ae701a25328a7b3ac033563a766d6d34fbbd4b48dd4885dcc47d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.1/archdev-linux-x64.tar.gz"
      sha256 "0e703dbcaaa3eb3da194a7240ce501c99c61ea5839c92fefff38dca3de1321be"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

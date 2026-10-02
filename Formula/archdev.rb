class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.3/archdev-darwin-arm64.tar.gz"
      sha256 "95a1c37190c666e33f902c83de5ae3a719e6aab10784a1888d4cc132b23e4004"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.3/archdev-darwin-x64.tar.gz"
      sha256 "97b09dc898b3d1042b405f9e71718951da9067f909602ad322af0a6298b3f2cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.3/archdev-linux-arm64.tar.gz"
      sha256 "372d8b9b71d260fc6e19d184ccc36ca3c56089376a8818f2f3ed237226b65225"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.3/archdev-linux-x64.tar.gz"
      sha256 "53b6d9421a8f9398dd72419c1b3b0fbc6c1b12ec2245529b8239f4c9be84fa37"
    end
  end

  def install
    bin.install "archdev"
  end

  def caveats
    <<~CAVEATS
      Run `archdev daemon uninstall` before `brew uninstall archdev` to stop
      the local daemon and remove its service. If you skip it, the daemon
      unregisters itself within about ten minutes of the binary being removed.
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

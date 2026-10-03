class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.9"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.9/archdev-darwin-arm64.tar.gz"
      sha256 "49e170526ca5106708a41cdc9b7665d625a4db7892b96e566c28f0f8ba54c834"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.9/archdev-darwin-x64.tar.gz"
      sha256 "8870cabd5caa5b6db107575df3eed5f6b73c529e60acf90ed4b57b0fabc1ab36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.9/archdev-linux-arm64.tar.gz"
      sha256 "7c3928c456df7be2a8ea5da5061970d77bc225f5c7766098d1c7718de09fb9b8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.9/archdev-linux-x64.tar.gz"
      sha256 "adbf1bb0980b8c0a26457fe59a2b142ed24c01a10efc3603e2018061be099f5d"
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

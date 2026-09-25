class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.4/archdev-darwin-arm64.tar.gz"
      sha256 "d0dc07f7d8f50eaeb84030b797ccd6716fc05a209925f43dbc7b935923e3c1a0"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.4/archdev-darwin-x64.tar.gz"
      sha256 "52924a5c175f6b8edc595307c09a66e355969824500ff29db61e1d45b47a1840"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.4/archdev-linux-arm64.tar.gz"
      sha256 "0bc8f4d14d2a3febc5ada29f82cd305f868e764fea614086d979bf56f128f497"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.4/archdev-linux-x64.tar.gz"
      sha256 "0a903678a5577407aaa5898c0889efbe89f2d787dc9d8fcccc30e13d46c80543"
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

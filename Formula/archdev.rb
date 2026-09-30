class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.1/archdev-darwin-arm64.tar.gz"
      sha256 "18757aa896add1c8b85babc08aabbf72c7a55eea8defddbc2157cb5adedc92cf"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.1/archdev-darwin-x64.tar.gz"
      sha256 "a2f6b6afec209c4bd19e293f1cad297fa92211a0a1666bde44c1c62e82be02a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.1/archdev-linux-arm64.tar.gz"
      sha256 "9e31171bb4e6c0ae8df25f7eb1dfaf62e1f6fdfde138d54b89114b9a53558c2c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.1/archdev-linux-x64.tar.gz"
      sha256 "5883fd1f1744688a54ceef83858660fdfc2a7b8f72d86366a50828b8ea272552"
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

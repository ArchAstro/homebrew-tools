class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.7"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.7/archdev-darwin-arm64.tar.gz"
      sha256 "72e08c374a67e6d4e52df5d2c2c47c9a28bcb27a21851e57dc6e97767db3839b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.7/archdev-darwin-x64.tar.gz"
      sha256 "204cf13782f00abea6afab93a82d60d3ff0b1c94fc04b022f1658f00e6383129"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.7/archdev-linux-arm64.tar.gz"
      sha256 "dc034b5696fcc2c5b651fa950f1c7638ee69cf26a5178ee598f7ff20cbb954d0"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.7/archdev-linux-x64.tar.gz"
      sha256 "8d395fd4b3137cf4bcf6207b6f0d4ae502bf63e74c230f909d920aee824b25b6"
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

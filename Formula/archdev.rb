class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.6/archdev-darwin-arm64.tar.gz"
      sha256 "29c4fdb957c86abcc6be6f0235ad1dd4c7571e0597482c9881c99c32bf245456"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.6/archdev-darwin-x64.tar.gz"
      sha256 "d87a19505e3f566d6032dc443c671ca7f5df70fef552eb97f709106dc30dc976"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.6/archdev-linux-arm64.tar.gz"
      sha256 "ba2dd495dc9d0ca4210626eda61de6061ebcc27dd93f85f662ae062549632cee"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.6/archdev-linux-x64.tar.gz"
      sha256 "72cf7a966153912a6bf5a21a68130411d064779cb9c31257cd73876140e6d983"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.11"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.11/archdev-darwin-arm64.tar.gz"
      sha256 "1e1e13e6ec4fa955807e923767fd14fe8e64053b8869b88226a1fe1fa4e0beb6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.11/archdev-darwin-x64.tar.gz"
      sha256 "20255849066228f4b1293a6f5a330667e6864c38990a364405c974220f8fdead"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.11/archdev-linux-arm64.tar.gz"
      sha256 "2282c60f45e7dc85dfe353a3963de909cb3ae52c2f59e90ee6c3825bee10b72c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.11/archdev-linux-x64.tar.gz"
      sha256 "cacbea6600c3cf143fd4ac3634afaf628b7d5605ec9c90a77bfd6e143063e421"
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

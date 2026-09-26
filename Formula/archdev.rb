class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.8"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.8/archdev-darwin-arm64.tar.gz"
      sha256 "bd85179f618f0d5e177e1819790447acc9b4c5ffadc34c06cfff1cf11f6a9263"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.8/archdev-darwin-x64.tar.gz"
      sha256 "42cd56f4132549b587c89cfb5eb5332e0d994d11a4b1261157e428b733c64f63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.8/archdev-linux-arm64.tar.gz"
      sha256 "c0ca4d5a7f123c518220a8dd0429beeda7581315287f99cda82734a3a94f1e43"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.8/archdev-linux-x64.tar.gz"
      sha256 "85f56ca6c2f8b1cf3b4405781a873e3a7d80789b23e6c9325f3e30f6d687c3aa"
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

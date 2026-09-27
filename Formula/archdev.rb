class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.10"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.10/archdev-darwin-arm64.tar.gz"
      sha256 "c9c395bf74cdbc3158f27c8dadfe816f7bc48f735672c3aae848917b456bdf5d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.10/archdev-darwin-x64.tar.gz"
      sha256 "acb9ac0bae6327166c45eb4128f6e99916455fcdc52083308482d35f7255b94a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.10/archdev-linux-arm64.tar.gz"
      sha256 "6981e05267c31eac426f80c621717abbfdc0c7ebb6608bcd6748d799d9090a09"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.10/archdev-linux-x64.tar.gz"
      sha256 "20add166861ec4bbdd2f61cde847a720df0909312abbc622a75eb9f39e08d71b"
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

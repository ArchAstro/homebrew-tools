class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.47.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.2/archdev-darwin-arm64.tar.gz"
      sha256 "28983193eaa448f3d49aac027d53a632052599a17a74092a65f2e64028ea70b8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.2/archdev-darwin-x64.tar.gz"
      sha256 "b1aa4ded4520e881eb18e9d15ca1c19b13e8125654b8cae3c8259164ccea5499"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.2/archdev-linux-arm64.tar.gz"
      sha256 "81bd20e93635eb17edbacd509b2d531d3aba3fe74819e6361450d4b98a1b3a45"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.2/archdev-linux-x64.tar.gz"
      sha256 "7e7ec3313189e3fa1ceeb4d7b4277950d602c2bdf81100b2b015085c3be9a891"
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

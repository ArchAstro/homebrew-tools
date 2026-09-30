class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.0/archdev-darwin-arm64.tar.gz"
      sha256 "64a7643bd5ef914a97f677656eb049e5d63cc892bdf5b1897b392fefc73ed536"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.0/archdev-darwin-x64.tar.gz"
      sha256 "b019ba5b375dad3b3bb718e2cec4a94410b4d4208f63f9b8590643fdc3deb9ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.0/archdev-linux-arm64.tar.gz"
      sha256 "17efa83e2ff87f2710eec342a41ffdaa9c319e4694c3951e4d02d1f7efe416d9"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.0/archdev-linux-x64.tar.gz"
      sha256 "67a7663311f8db1113a4c539388f8a69df777bb31762bf0670059357e1857bdd"
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

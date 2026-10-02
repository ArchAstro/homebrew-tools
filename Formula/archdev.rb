class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.4/archdev-darwin-arm64.tar.gz"
      sha256 "9dc0da2a4c6050f8d6f40d52d9a8ca66eaf85a10add1d30f8e0528685cb87871"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.4/archdev-darwin-x64.tar.gz"
      sha256 "e82cf92e557bfc3877388c5c69b69f068a02b24d4e99643e4511534d6f78e138"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.4/archdev-linux-arm64.tar.gz"
      sha256 "44383bd023d5b17a1298d93f77e0b7ac6523858473072d44cb26efcd71d9429d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.4/archdev-linux-x64.tar.gz"
      sha256 "109c2991c752c6e11743e12b6142e10c9c886d02d008b143ceefaecf72b75737"
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

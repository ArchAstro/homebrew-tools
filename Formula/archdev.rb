class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.5/archdev-darwin-arm64.tar.gz"
      sha256 "b98a880623194ad187a7bd8d0847641fc55cf5d6094fd68c28f404eafdb895ce"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.5/archdev-darwin-x64.tar.gz"
      sha256 "3d58a62625cc56bb3476f29ca827a45743a0ec8f688ff3cc2b62437340e6a5e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.5/archdev-linux-arm64.tar.gz"
      sha256 "725b48a8662b3061cd4774682b054c533637b0d604d1e817f7eaabd51404f23d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.5/archdev-linux-x64.tar.gz"
      sha256 "5de5cf826f4af57e3f60405dc82c16007860a32724a8a6ba60a86ba9fbdb448c"
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

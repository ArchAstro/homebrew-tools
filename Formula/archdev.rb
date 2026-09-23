class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.8"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.8/archdev-darwin-arm64.tar.gz"
      sha256 "ab8df17ef85825b17c6966d53158f59b9dc53b926b465d840e979d8d7257be70"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.8/archdev-darwin-x64.tar.gz"
      sha256 "b5c244a60e3d26068dc91c241e0537352726a356517bf1d14f4e1f84b6540bc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.8/archdev-linux-arm64.tar.gz"
      sha256 "fbd96c264e0a1092fc9c7eef1c145eec32b0e3547a3c5f5dc2e3f51ee685214e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.8/archdev-linux-x64.tar.gz"
      sha256 "7428fc4c679b983e744ab0fbe76d7f944b388e05b635ada71fd568b5b03bd57b"
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

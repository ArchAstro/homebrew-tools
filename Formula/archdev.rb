class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.10"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.10/archdev-darwin-arm64.tar.gz"
      sha256 "30870faf56a061a7e902a970493e20fc19b8251893a865eed712cdf53e71b61f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.10/archdev-darwin-x64.tar.gz"
      sha256 "960ebe3b981e016326b1cdc83611ecf66b3d118ee234e2172af30216621319e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.10/archdev-linux-arm64.tar.gz"
      sha256 "e68a52faa97d7a648dad9cc433fa060dbdbc245ad2ca55b51440c4cd486e438a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.10/archdev-linux-x64.tar.gz"
      sha256 "881e1b498e4af7fd566be6b360065487166342b6aab5631be3673f7b647e691e"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.12"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.12/archdev-darwin-arm64.tar.gz"
      sha256 "269532c127e3c4b6c80e020a879d85bdf000305e4b7974c96025a5bb4ed97562"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.12/archdev-darwin-x64.tar.gz"
      sha256 "6939220b8f25bbad899d724d592994827ea1b359e25cc62683beee7585d5d852"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.12/archdev-linux-arm64.tar.gz"
      sha256 "9ac50895a6afdc592561339ae8c795521009da784b41b7e2514540b765472380"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.12/archdev-linux-x64.tar.gz"
      sha256 "07f39b695ded38c37088a7de6fc01cca0cd53aa6d9aa034fe423536a5e5153ac"
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

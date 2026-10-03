class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.8"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.8/archdev-darwin-arm64.tar.gz"
      sha256 "60eb80595f66d92a2a9a05ac77dc0c75af5edce9a67b1f76abdd7330afa8c746"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.8/archdev-darwin-x64.tar.gz"
      sha256 "d351bfb3699ac43ca912f7bbb7eff10e375d4333008a84b9deb0262865b1d194"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.8/archdev-linux-arm64.tar.gz"
      sha256 "decd9941edf57eee7218a325f2eee6cef62af515b05d10d12ecfb82736a32e69"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.8/archdev-linux-x64.tar.gz"
      sha256 "8ee5b1db32710b9ea9efd566186b1e883e4f73f4045851e88aae06e302bc2c45"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.2/archdev-darwin-arm64.tar.gz"
      sha256 "e833e4a7faed27a131eb93586e63983a0826a77ac256a330c9b59a8512fcba7c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.2/archdev-darwin-x64.tar.gz"
      sha256 "9c9dd73ad1561d01a24fc7e1dbb69519b6e4dd7cb075c751d810fe124bcea706"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.2/archdev-linux-arm64.tar.gz"
      sha256 "2be7bb9851e806cae8fb514dea7c63eedab4e4a5c0bba7191c90111453e12172"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.2/archdev-linux-x64.tar.gz"
      sha256 "145cbf52c2dc0661b16bfa695b0e3ed7ea9db14f432c9f84771de0d39a31d4c6"
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

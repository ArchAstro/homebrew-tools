class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.0/archdev-old-darwin-arm64.tar.gz"
      sha256 "8862f5de54fd965dd0e9b1fca094054f30c01c59b6000a3ae43c75b3217d3928"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.0/archdev-old-darwin-x64.tar.gz"
      sha256 "7e5af4bf47b1b3421de7e1d35dc25fdea93b7afc99543aa4deed2cac8bfc8c8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.0/archdev-old-linux-arm64.tar.gz"
      sha256 "c7e3712cd07f5a70f01cb590fb9417e699981bbb8316ab3701f0a67d1a861596"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.0/archdev-old-linux-x64.tar.gz"
      sha256 "e5d35f5bdacedaa6e4ed28dd6ddf3b3046f52470338b6023ae4e7c110fde86e9"
    end
  end

  def install
    bin.install "archdev-old"
  end

  def caveats
    <<~CAVEATS
      archdev-old is the TypeScript build of the ArchDev CLI. The archdev
      formula is now the Rust build; the two install side by side.
      They share ~/.archdev (settings, sign-in, and the local daemon service),
      so run only one of them as the daemon.
      Upgrade with `brew upgrade archdev-old` or `archdev-old upgrade`.
      Run `archdev-old daemon uninstall` before `brew uninstall archdev-old`
      to stop the local daemon and remove its service. If you skip it, the
      daemon unregisters itself within about ten minutes of the binary being
      removed.
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev-old --version").strip
  end
end

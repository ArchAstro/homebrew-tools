class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.2/archdev-old-darwin-arm64.tar.gz"
      sha256 "bf35d640efa10b450c01ca49923781a7f6a90806a7ac60200db7dd35f0c2f9c5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.2/archdev-old-darwin-x64.tar.gz"
      sha256 "a66e58ff6f1c0f3b0fe3942ad0a8c370418f334cdc9a829eb8e079ac532f9e8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.2/archdev-old-linux-arm64.tar.gz"
      sha256 "80e6b6846ffe7894804c1d7b40b8f7c4c277f86dd76877ab3428329736a1d8fa"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.2/archdev-old-linux-x64.tar.gz"
      sha256 "03dcf49b26828f99067cd5e2375ca2272546b71d1daa5bdc0c0b38b4e99a4dbb"
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

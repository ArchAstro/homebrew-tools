class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.5/archdev-old-darwin-arm64.tar.gz"
      sha256 "09e96bcb4b8224a1b4bc21164a7b976f4a5330a783d9baad0958bee6ff6a46a8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.5/archdev-old-darwin-x64.tar.gz"
      sha256 "0d6ee6ff6d08de1e899a9a363f9928e007626ed138005f3740ad9d7d0bc633d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.5/archdev-old-linux-arm64.tar.gz"
      sha256 "fbda931e5cf4eb928660862c468e6d3c1207b8defc217784062a7efbb5d5be5d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.5/archdev-old-linux-x64.tar.gz"
      sha256 "c535a9ef09a9e4dae8d112aa81c92f1254510bfd7c550c362a37958f4ef41daf"
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

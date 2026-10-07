class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.4/archdev-old-darwin-arm64.tar.gz"
      sha256 "dbe34e7f8f2e0c3a3563c2c9933bcf3e1f431583e94bc854e8c8fc08fbe32f02"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.4/archdev-old-darwin-x64.tar.gz"
      sha256 "f1e10b180330849e39ccff8fc7040d8cbceb85a153fc01b7d11d8b97da2e5032"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.4/archdev-old-linux-arm64.tar.gz"
      sha256 "5636d80d754a1ec8bdeab7ca45aecf2003d6858c8d41a5fe6983eb9d1b87287a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.4/archdev-old-linux-x64.tar.gz"
      sha256 "229f701c748a3634ff05296f2bbc96bc13217b93eb96abb6a3a48f3805f94ad1"
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

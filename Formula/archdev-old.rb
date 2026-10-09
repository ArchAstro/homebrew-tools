class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.3/archdev-old-darwin-arm64.tar.gz"
      sha256 "7307fda45c4d9ac920f2d19ee4269bac79b0dc5f0e4aaafdc787de80ad94ca1e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.3/archdev-old-darwin-x64.tar.gz"
      sha256 "4c19bf5c192cc167823a465df4b0472b0ce30e7c95d1a8c9c245d4fc014dbfd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.3/archdev-old-linux-arm64.tar.gz"
      sha256 "bcd25fa5ecc9e1d7872486c1c6c0c087f4d26858a950885097cd88c62d1dd5c4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.3/archdev-old-linux-x64.tar.gz"
      sha256 "faf773a2366aea2e28caf57491a2b814f1b3531411913be17c639e1e73d27bfd"
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

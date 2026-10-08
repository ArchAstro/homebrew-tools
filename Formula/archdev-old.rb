class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.0/archdev-old-darwin-arm64.tar.gz"
      sha256 "62f03c1125afb7998340b638cc53a86284b0193d6040d67d919a08f973cd75a4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.0/archdev-old-darwin-x64.tar.gz"
      sha256 "90b2aa2e75f2f904c3cbfd37b06d2708d43224e1728ac6afa5971a089e809f60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.0/archdev-old-linux-arm64.tar.gz"
      sha256 "d66e8d1392c3329f4dc2d8a106bee5c571ba1ab2b191ed9ff3c91e9fa48ea387"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.0/archdev-old-linux-x64.tar.gz"
      sha256 "b1781db31017c8521f2d7f706b369088e7c0b38f99ee1afc06d579d7832c7295"
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

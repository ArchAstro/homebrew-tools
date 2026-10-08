class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.6/archdev-old-darwin-arm64.tar.gz"
      sha256 "29e9c9ba810c285112b833f3f8496ff23b089ef5feabdbc154a66ea25d77b857"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.6/archdev-old-darwin-x64.tar.gz"
      sha256 "cfaf1fd332836d0801c52d2f0d95ade0866b53bd55b6dda0761b8d3385b63ccd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.6/archdev-old-linux-arm64.tar.gz"
      sha256 "92c3ce1ba9728494b1a68cb1af65cd2180e492f08086ae9274b19c78d4062d55"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.49.6/archdev-old-linux-x64.tar.gz"
      sha256 "75c7cf2bd6c753690803a76f7e451bc8edde9b36126760af8acef8a6d5574e1f"
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

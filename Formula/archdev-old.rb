class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.2/archdev-old-darwin-arm64.tar.gz"
      sha256 "960bc7a96a3cfe68678715bede25dadc32e500fb34a4d5a551d2ea9788b2e2bb"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.2/archdev-old-darwin-x64.tar.gz"
      sha256 "c89a770596ccda3144d15f3ee57d79ce3d019f0f08b38c0f0ed0cafd79e6aad7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.2/archdev-old-linux-arm64.tar.gz"
      sha256 "d1307cc7a6de148ec7e239e6b3324087b6c48411ae8c87e9cb976f0abfcf61f6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.2/archdev-old-linux-x64.tar.gz"
      sha256 "de8de03477c047b5388c7a1b0515d56489e770c8e5698c1c2856e083b6bc4e7e"
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

class ArchdevOld < Formula
  desc "TypeScript build of the ArchDev CLI (previously the archdev formula)"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^archdev-old-v(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.1/archdev-old-darwin-arm64.tar.gz"
      sha256 "9b1ae607b36345b516dac30aec47d768490925844f829daccdef4464bda7ce19"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.1/archdev-old-darwin-x64.tar.gz"
      sha256 "4e34fc0ba85f3225398c5e9feb0fb7018238c578e2c0e0cad9759dfff24d9fc6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.1/archdev-old-linux-arm64.tar.gz"
      sha256 "33074f3a2125b46922a6c8ccb6e4873a330ce7d94d1a78ddb1fc039828a82abf"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/archdev-old-v0.50.1/archdev-old-linux-x64.tar.gz"
      sha256 "e5d19a6e1218eaf69e8ac1603659c32598cf98f4cd92a1ac66fab58906c12a46"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.4/archdev-darwin-arm64.tar.gz"
      sha256 "07fdb2654e35a472c19af800c8d917f6e05511cfcf805b1851f5181e2b82d377"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.4/archdev-darwin-x64.tar.gz"
      sha256 "9a536eff3568f716c63570eb28bf0eeede894f2ee61cd8b6c081e6ef11d24102"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.4/archdev-linux-arm64.tar.gz"
      sha256 "32fc18d1659f26f8ac7833de657c2e3cb01ceb3a07dc18914815117b57fc7d6e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.4/archdev-linux-x64.tar.gz"
      sha256 "22c1ab4dff51506f3eb44abae497abd8be1f536b25b51ddd244ae48bc56d6a55"
    end
  end

  def install
    bin.install "archdev"
    generate_completions_from_executable(bin/"archdev", "completion")
  end

  def caveats
    <<~CAVEATS
      archdev is the Rust build of the ArchDev CLI. Earlier releases shipped
      the TypeScript build under this name; that build is no longer released.
      A daemon started by an earlier build restarts onto this binary the next
      time you run an archdev command that changes state, or at once with
      `archdev jobs runner start` (which interrupts running jobs). A busy daemon
      does not drain and restart itself yet.
      Run `archdev daemon uninstall` before `brew uninstall archdev` to stop
      the local daemon and remove its service.
      The first archdev command you run in a terminal also installs bash and
      fish tab completion under ~/.local/share, where shells not installed by
      Homebrew look for it. `archdev completion install` does this on demand.
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

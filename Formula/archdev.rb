class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.2/archdev-darwin-arm64.tar.gz"
      sha256 "d32e938abeb0046539bb5f94e93758b54773896ad9859d6256d9163c2ebe0604"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.2/archdev-darwin-x64.tar.gz"
      sha256 "e64db8402f5f412bd886d0196a8a65bacf8511c4b0ca2bc96ba9dbbb42d66576"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.2/archdev-linux-arm64.tar.gz"
      sha256 "3e313b6839cb27766b3a9063b1e24c857f1dbec81b432aa0063f7ac0125591f9"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.2/archdev-linux-x64.tar.gz"
      sha256 "ff376bf39e002697d1488703b08305dfc6e246d26f0897197ff8d05ce3c9d55d"
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

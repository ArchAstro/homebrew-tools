class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.58.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.0/archdev-darwin-arm64.tar.gz"
      sha256 "799e0c7dad5e448fa258c8c5b9f2b252c27a2ea8594fc9dc469847424a39fab2"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.0/archdev-darwin-x64.tar.gz"
      sha256 "c2f364364fc21861ab26e85c8abdd099f9ec70db4845a2c1be04831d4b0bd249"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.0/archdev-linux-arm64.tar.gz"
      sha256 "9dc168210f3c26886c4bddf0381d316dfa6f6d8a25cfbce68d36704d01ce651e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.0/archdev-linux-x64.tar.gz"
      sha256 "6da2bbaab1f995aef16b80fcfebd268c5a432274ecee93d34421a7f0bc1609cc"
    end
  end

  def install
    bin.install "archdev"
    doc.install "THIRD_PARTY_NOTICES.md"
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

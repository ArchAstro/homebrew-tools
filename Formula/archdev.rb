class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.60.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.2/archdev-darwin-arm64.tar.gz"
      sha256 "bf8d7b281641a4d3e8c3d94c68b42284a341949e9adc5b4ff4004c99a61cf59e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.2/archdev-darwin-x64.tar.gz"
      sha256 "be84aeea6d667304ede4383fc0834ea8be4920ef66bd3b356d4ceea297010147"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.2/archdev-linux-arm64.tar.gz"
      sha256 "ab6e289bd34fe885a3259dbabfef2cf26848351963985c6c9d39c49c1b3783ef"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.2/archdev-linux-x64.tar.gz"
      sha256 "51da39df43924ff6bc4058f39e0925db92e647632eb1a257edbc6c317a7eb74b"
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

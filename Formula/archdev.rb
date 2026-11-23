class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.10"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.10/archdev-darwin-arm64.tar.gz"
      sha256 "c4798aa5dd6d76e132debe544d5403da9b5310506581a6f629861af69e7fcb2c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.10/archdev-darwin-x64.tar.gz"
      sha256 "c641bc3ec410c9222dcdebc6aa6168d2fa4f8c2081090167e140a169d603e530"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.10/archdev-linux-arm64.tar.gz"
      sha256 "720e3ca1a73abb89cffef57204a21eb232b093a8ece2f59e858676cd2c3ce70e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.10/archdev-linux-x64.tar.gz"
      sha256 "059a56cd91fb78f80a7288f6a61bd8f82769091f455ee4761c55f5a35e5c0c5e"
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

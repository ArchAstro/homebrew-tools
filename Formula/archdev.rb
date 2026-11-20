class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.3/archdev-darwin-arm64.tar.gz"
      sha256 "1fe99f3848619d21dc78dc2eda31f1c6420ebbb5e9fa6f04b1e10af9fe3b7861"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.3/archdev-darwin-x64.tar.gz"
      sha256 "85ca68735a40e728ab55b35dcb9ea949905be75f385252c1b54c7f17a1f89d0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.3/archdev-linux-arm64.tar.gz"
      sha256 "4a36e9e7ce86d204c48d7bb5d5da485563ab8f9b3cce91e3974599c917ebd0e6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.3/archdev-linux-x64.tar.gz"
      sha256 "e4b82a3d5f688d9b89217297c999b036db5b9e6b688ee297b7d1c8f3b9edf185"
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

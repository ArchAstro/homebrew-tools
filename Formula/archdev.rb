class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.61.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.1/archdev-darwin-arm64.tar.gz"
      sha256 "91a112ced2b91a0a3773eaca24e7c4661ab7ab2b2e91f461719d6a6fdbf0bf05"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.1/archdev-darwin-x64.tar.gz"
      sha256 "e9bac580156747ca729fa9ce34e1c318f9e5f7f94a2a7addfc04cf5a9f29c17a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.1/archdev-linux-arm64.tar.gz"
      sha256 "aa28262abc8b0c1792bdf93e6ae55c5d92128eab9364545a38afc7afb28e6471"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.1/archdev-linux-x64.tar.gz"
      sha256 "7b56a22c18c0c9a74265444f2c886546271bf9ed4f207de83a4f6a31553a37c0"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.14"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.14/archdev-darwin-arm64.tar.gz"
      sha256 "2a9f317cf68092a7fe9a67b40b1b76c9b67b76eb3b13982147d40245d27dcb6d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.14/archdev-darwin-x64.tar.gz"
      sha256 "ad41bc5a637b7562af6cd6407425e4fd2431f50e0f6709ec3eb9da83d5e6a100"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.14/archdev-linux-arm64.tar.gz"
      sha256 "6e6dd6f88e988861d3c9d969cf5d539a807b2ce7df3e818a144b56e1f61ebaff"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.14/archdev-linux-x64.tar.gz"
      sha256 "6eeddc2a8703e374ba46c5da908d13a9667a62adc3715d308507d66a8f65c089"
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
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

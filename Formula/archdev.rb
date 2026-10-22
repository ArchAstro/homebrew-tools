class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.15"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.15/archdev-darwin-arm64.tar.gz"
      sha256 "45d411b7157e88bdc9a5ec551da903f9f9de4c409922dacbb44b0cf4d45d60b9"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.15/archdev-darwin-x64.tar.gz"
      sha256 "f05af4436100f3505c2632715bde7751e40aa1c1dd66c9eb076b089bc47c25c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.15/archdev-linux-arm64.tar.gz"
      sha256 "a6146303f7f859ae31a627d87b9521573f1e67706aa95ac33d5657df599b8506"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.15/archdev-linux-x64.tar.gz"
      sha256 "14b412f65c07cff47b6d898dabda7e661e031265bfac2bbde47164e76feb65d0"
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

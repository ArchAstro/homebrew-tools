class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.9"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.9/archdev-darwin-arm64.tar.gz"
      sha256 "5f6d6162a7785580f12dd849931c2a46213597313faa2e49543d7c9c1ac3ae39"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.9/archdev-darwin-x64.tar.gz"
      sha256 "6eb52dc55e8c5007f8e0d3f50100c25056b491740818bcdd51b7122a81c7d81a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.9/archdev-linux-arm64.tar.gz"
      sha256 "1aabde3f9206549282d8abc137c8ebfe3acbb4fe143277bdeddf599ee1b8d2e0"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.9/archdev-linux-x64.tar.gz"
      sha256 "86ee99c04b14fcce8e0bfb00384748ab34490e2d0c6c113038d49258c1baf069"
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

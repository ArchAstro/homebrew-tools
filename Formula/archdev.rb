class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.5"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.5/archdev-darwin-arm64.tar.gz"
      sha256 "35d5b7663fba4a713de8f66ef00456d219a2b92cb05e1dd372ccf4d9035c51c3"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.5/archdev-darwin-x64.tar.gz"
      sha256 "13c3d282311bedd8f6a7072bd8961c048ba03ed7118884a6cd568e7051318d76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.5/archdev-linux-arm64.tar.gz"
      sha256 "6bb29b71956dc1b1ad0ba4c0ac7d7033cd209f30fbce1a957df038510ee361b9"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.5/archdev-linux-x64.tar.gz"
      sha256 "2b0573b0b7bd0b6b1be4029c4aa7590a7a334ca10be93b6f242f31978b5f87b3"
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

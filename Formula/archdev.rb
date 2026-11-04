class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.8"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.8/archdev-darwin-arm64.tar.gz"
      sha256 "8e7bade87a08826c442621562867a846ff32f6032aed4e2e37e04abf79987553"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.8/archdev-darwin-x64.tar.gz"
      sha256 "f2306798b2428a31bf028f76fba45fffefd2c2ff400ff03281203f4fff28ae31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.8/archdev-linux-arm64.tar.gz"
      sha256 "4501076d4f913fb4bf347e2af993d1967aa033c21944b919e9a9b7fec610fb65"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.8/archdev-linux-x64.tar.gz"
      sha256 "2a0cd785c620e51787f25ed44bf55eac1931ebd7f101b6d1221ef898c26e1e72"
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

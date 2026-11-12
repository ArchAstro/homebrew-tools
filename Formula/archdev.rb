class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.60.6"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.6/archdev-darwin-arm64.tar.gz"
      sha256 "0a34be7ef642ddd7f29a74392f89ccb0144b03e65d916ce06e22f87ba21ff9a4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.6/archdev-darwin-x64.tar.gz"
      sha256 "fa663857f7a543281d7d554c589dc8dcd4d5ac8c0405895c34fde18c22902dc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.6/archdev-linux-arm64.tar.gz"
      sha256 "12cfb7858b1d46049cc6d43c97ef8f788c836cf2410231f6bf888b2357deaf03"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.6/archdev-linux-x64.tar.gz"
      sha256 "d6885a4da85167ae01b2dee685964106e686e5bc6b26e47407c9eb25230caa87"
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

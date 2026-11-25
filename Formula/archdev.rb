class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.13"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.13/archdev-darwin-arm64.tar.gz"
      sha256 "d6d29da4314a695004c1321a6271fc1c29c983a8fc4618838c4762f646af8d37"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.13/archdev-darwin-x64.tar.gz"
      sha256 "4afebace7bed7f776890ba2f8883f4c35c9ae2d07876985c7ca4035758c7fe8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.13/archdev-linux-arm64.tar.gz"
      sha256 "c45fb5ed511955858913a5033bcfc9c8779d092713be4aa20cf6adceafbe3a91"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.13/archdev-linux-x64.tar.gz"
      sha256 "e0c3b8a251d496f6ed58d9ad747286f592c1ed8548c97af1a2d892016efd874b"
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

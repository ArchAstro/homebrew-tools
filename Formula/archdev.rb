class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.0/archdev-darwin-arm64.tar.gz"
      sha256 "e9c50c11380a92ad236f1faf95e8c9ad4f636cacc2c1f40e4f0393f7e76cd929"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.0/archdev-darwin-x64.tar.gz"
      sha256 "5e89bba1cb245767717f58830d3b706692013a16cf31b88d0689f130725ab282"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.0/archdev-linux-arm64.tar.gz"
      sha256 "eca33dd67c82a7d49be0a4f8ebaba0207cf56f2f7c7f452dea6d327ae030d2b4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.0/archdev-linux-x64.tar.gz"
      sha256 "5a43a869b6a491d4ed97f6caa71e6f9da0e8f0eb66469c129591608a5e9c0ffe"
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

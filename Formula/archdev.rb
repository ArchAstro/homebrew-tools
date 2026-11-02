class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.5/archdev-darwin-arm64.tar.gz"
      sha256 "f2fad52e5c2830bf75184afb3eb1e1844664469f9b0ce22c14908bd2460f7f4c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.5/archdev-darwin-x64.tar.gz"
      sha256 "f6014d557e7190c0667462741b576e04efd9dd33fea0f2f89e476957a713cb39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.5/archdev-linux-arm64.tar.gz"
      sha256 "3d2ae7302afc7e753c5dc1b864d8a589b570782d61b4ab26ce54cd23dcbc5d2a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.5/archdev-linux-x64.tar.gz"
      sha256 "7a132dca567c1a59d6876f2f6ef1557179d2a750bb9a4bfe9015b58af6af9587"
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

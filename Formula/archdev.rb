class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.11"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.11/archdev-darwin-arm64.tar.gz"
      sha256 "c180adfab3d96111d5a267f71b2fa2d2cf62b39b95456607ac5622686669bc95"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.11/archdev-darwin-x64.tar.gz"
      sha256 "a87d222a90ec487523f8ac33f4f8264ade65386be72024194ee70b737cbd033b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.11/archdev-linux-arm64.tar.gz"
      sha256 "be0ed23e878ff73e1fb23595cab8b62a0744a532986a29e2620525d7f9a45d24"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.11/archdev-linux-x64.tar.gz"
      sha256 "bac1f7bad0d206e5b33693d5780185b61b0ab3809ae1388bb09bfae7409fd105"
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

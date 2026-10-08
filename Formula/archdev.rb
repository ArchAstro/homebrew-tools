class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.1/archdev-darwin-arm64.tar.gz"
      sha256 "8952ba63e01403f236ad5efaaae947638cfe3132f52f6d831bbdf37b83760b2e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.1/archdev-darwin-x64.tar.gz"
      sha256 "4c627e1883296de5cde1a0b251d096e4a3e834dfc6705a2dda1fa7a972d08560"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.1/archdev-linux-arm64.tar.gz"
      sha256 "a5f98009e864309ef8436294d9ebbcc12154cd8e22036a0c5ff163aed7a85d5f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.1/archdev-linux-x64.tar.gz"
      sha256 "16d8f3cf2dc2f298668834d49a8ac033a80c19c08d750673e5299d447018a062"
    end
  end

  def install
    bin.install "archdev"
  end

  def caveats
    <<~CAVEATS
      archdev is the Rust build of the ArchDev CLI. Earlier releases shipped
      the TypeScript build under this name; it is now the archdev-old
      formula (`brew install archdev-old`, binary archdev-old). Both share
      ~/.archdev (settings, sign-in, and the local daemon service).
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

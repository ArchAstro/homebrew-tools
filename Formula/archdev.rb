class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.3/archdev-darwin-arm64.tar.gz"
      sha256 "16c39238617726e549b7e03b6830770385c02608603429931b38ad3d50926d2e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.3/archdev-darwin-x64.tar.gz"
      sha256 "e6046afc88c14e3624c10d25f91fe5d86c3fd396bd5892a379e35731e457d1ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.3/archdev-linux-arm64.tar.gz"
      sha256 "815b76b94aa356190b090b27573b30b792fd1d4a513c251d50300ee0d500500d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.3/archdev-linux-x64.tar.gz"
      sha256 "9e1f331cab8dd459a719c77fc953164c918c7dfa13c87dbb12d3cf5e16952adf"
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

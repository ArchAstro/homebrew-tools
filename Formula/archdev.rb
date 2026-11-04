class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.7"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.7/archdev-darwin-arm64.tar.gz"
      sha256 "dfc4ddb27584c2ae8a6ea23e056640c84b113a4bbe3895074c017f6bdffd9931"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.7/archdev-darwin-x64.tar.gz"
      sha256 "e15260cbbf128d92c0c588e389ec011c63f665aab57d63a98f3ead4b9667092a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.7/archdev-linux-arm64.tar.gz"
      sha256 "4986de1ff4454cc24bb5589807595ee3930130613aa0f685e67a60ed60ae3294"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.7/archdev-linux-x64.tar.gz"
      sha256 "b9f9ba3c155a4dbe927531975c3f10661cb3e249c9f35323ded45b6c56768b20"
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

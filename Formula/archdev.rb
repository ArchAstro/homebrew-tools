class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.5/archdev-darwin-arm64.tar.gz"
      sha256 "9f2e87af6d4026563b6b3b942cedd63f7b289ffc1134a376b285adb14ddf966b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.5/archdev-darwin-x64.tar.gz"
      sha256 "12c24a5f3c18861bafaad2050152aabb5f0615a1aa4c102d9f1506b78c068a35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.5/archdev-linux-arm64.tar.gz"
      sha256 "78d0ca4b9490dcb6269619af6f7817b97d50b4b6865d7f93803987524ed988ee"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.5/archdev-linux-x64.tar.gz"
      sha256 "654f392d73952dc3a34f148e784b2196825d2385457e62df5f79dd98bf1e7f65"
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

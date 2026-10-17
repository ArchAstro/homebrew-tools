class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.2/archdev-darwin-arm64.tar.gz"
      sha256 "bf38462bd82378abdb3c4a20ef6fabf8da913d40256629d8a9386d197fe3d02f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.2/archdev-darwin-x64.tar.gz"
      sha256 "d7e78be455606e5743bb7381567a0ac5c96f97ea977e268f129003084dc89c58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.2/archdev-linux-arm64.tar.gz"
      sha256 "31ce5be64aaec0a2c8dd1b56d31b7c775a99ceb2608cd45a96f8d624fa2ab638"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.2/archdev-linux-x64.tar.gz"
      sha256 "22a0a0d87b173c92607cb1e91976078232c2ca5f3d8bb28446a2a71a9df5fe18"
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

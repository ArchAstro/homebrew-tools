class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.12"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.12/archdev-darwin-arm64.tar.gz"
      sha256 "22456d1c4e64e165c8b985a1dc5223439aae52d346a31f1bb3de4a6708db0479"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.12/archdev-darwin-x64.tar.gz"
      sha256 "b238d2a217efacec75094b80bb792d97723fc960b3d52222b5b414fe2091be55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.12/archdev-linux-arm64.tar.gz"
      sha256 "85df3228a0afe7974689aa6a0a03cb0b832dd32f0522580a6f776efd3980f8c7"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.12/archdev-linux-x64.tar.gz"
      sha256 "5d6992574ed1a5db2755fff1cef7f6a07d642caf9bd24bf00b9e96f8c16eed75"
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

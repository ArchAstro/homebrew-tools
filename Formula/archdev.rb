class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.7"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.7/archdev-darwin-arm64.tar.gz"
      sha256 "0f6df277ed36f628423a7014ec755d09f436238220cdca6c9dd9fb1842bc0a0e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.7/archdev-darwin-x64.tar.gz"
      sha256 "e7e86d1f6c00dac9ae0d483462e5061b067a9feed0ea1c984b8b7f28371f487e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.7/archdev-linux-arm64.tar.gz"
      sha256 "db4876e09fe89ee7226ad2c15979142793f62c60dc0df8a901f98935d526daa8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.7/archdev-linux-x64.tar.gz"
      sha256 "872bfcfd1005abd956acf0575d4d390c9b8acf85b1c8a8f40ce281c390348298"
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

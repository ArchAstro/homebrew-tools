class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.8"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.8/archdev-darwin-arm64.tar.gz"
      sha256 "4f57cdfc9dc15cbef638a81f469b037202bd4d1df642e2dc8d2b77516cbcfabc"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.8/archdev-darwin-x64.tar.gz"
      sha256 "6b714df74148d279d94f22eac36d32191deb68af0ba683a0e626545a3366240c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.8/archdev-linux-arm64.tar.gz"
      sha256 "d83a1ca7fdb2a366e5077980374d002eb39b3cceb8bb999864895ac4a7625955"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.8/archdev-linux-x64.tar.gz"
      sha256 "9435c8d7f22faff5d80d46c4b55a039ff4e22acf8d2ba47fedd87f14bb42ca15"
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

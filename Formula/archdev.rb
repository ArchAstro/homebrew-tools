class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.0/archdev-darwin-arm64.tar.gz"
      sha256 "0987e7f4917d629292f62d531452cd526407bc608c8c5fee7167be81e6443e76"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.0/archdev-darwin-x64.tar.gz"
      sha256 "6e948c27b8cd085c5f5f2c1cbf3ad6b25d9e991341558d3f8af9a0fcf5583453"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.0/archdev-linux-arm64.tar.gz"
      sha256 "a6f2cce1e0555008a5bb8c5f4f5aa44826d878ff1b5735e11bfd271e9ca25526"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.0/archdev-linux-x64.tar.gz"
      sha256 "64f7d6480607ffe49e8aa258417b2f7b549e760c34e1c520d75a53b2271d7bbb"
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

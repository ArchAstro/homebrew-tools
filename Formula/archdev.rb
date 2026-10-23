class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.18"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.18/archdev-darwin-arm64.tar.gz"
      sha256 "cc67d14a49c6a159b6682deac01fb2ce84d5d7928f379bb333ea2b84aad17ae9"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.18/archdev-darwin-x64.tar.gz"
      sha256 "5d163ad4ed5f9f7eb5eb530f238373a3dad329491064ab02ac48ffa96956d4e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.18/archdev-linux-arm64.tar.gz"
      sha256 "b2f3f833f472e6ee47a5fe7fa44e2c1ef98eb5e3f1a1f3d975b340cc2ddd86fd"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.18/archdev-linux-x64.tar.gz"
      sha256 "df200c0e7de9c3f600b8031f72fcbba199e4337cf41e98b2a83fc233b4ed838d"
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

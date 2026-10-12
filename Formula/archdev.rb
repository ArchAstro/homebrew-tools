class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.52.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.0/archdev-darwin-arm64.tar.gz"
      sha256 "08480cc4a7927a736cac90210a08e43e1a48f50f73aa4721a32360a28a8cc97b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.0/archdev-darwin-x64.tar.gz"
      sha256 "f0e75b70e9c0a0e274e3a20d8b92e9e54465ff79a9f80052fc622a14278b8027"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.0/archdev-linux-arm64.tar.gz"
      sha256 "8d18c7e39a0346d2f0f8645925c2d45ce01091b1828d137dae54ff1490cf6d8a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.0/archdev-linux-x64.tar.gz"
      sha256 "6115520d67473454dd00ce4b1f6b9ea501b7f81bb930964b550a93ee1936f0a9"
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

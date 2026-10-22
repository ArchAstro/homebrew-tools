class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.13"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.13/archdev-darwin-arm64.tar.gz"
      sha256 "c3b61724d7f81618e369995010e462da14dee3b8c5fb8f9ff3a441661ee3a0d6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.13/archdev-darwin-x64.tar.gz"
      sha256 "768731014612e922fb98cb4954102c0414037f1bb7150c8100414cc3b42dee27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.13/archdev-linux-arm64.tar.gz"
      sha256 "e80e0d2a5103579e42c389b9a1ddb94ef50576055e55acea9e7d9563486e4bcc"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.13/archdev-linux-x64.tar.gz"
      sha256 "dd1a9731156dbb2b5f93d94ca273a68d6ec8d66f100ae3e22bbef02f61690de5"
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

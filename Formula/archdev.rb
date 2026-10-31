class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.0/archdev-darwin-arm64.tar.gz"
      sha256 "2ca4b29eae7c1b775727d70261220dca7b0abcf4a791bad89d69e19a139fa921"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.0/archdev-darwin-x64.tar.gz"
      sha256 "a151c16ce729effe750fb4ab56cefe0289e8294870bd0ca0f09f356564a42102"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.0/archdev-linux-arm64.tar.gz"
      sha256 "2abf6941c51ff51cb667dab2e9ba844c004ef5375defda703d0561571443354d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.0/archdev-linux-x64.tar.gz"
      sha256 "6256fea19abb265b7410a5e1d35dc574fa1032796985ebb3d50fc9fd4015d82e"
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

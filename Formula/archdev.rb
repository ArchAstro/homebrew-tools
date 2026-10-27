class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.6/archdev-darwin-arm64.tar.gz"
      sha256 "73af3e03a9dbe45e1d8f137bf1da469161a9925f89d48c68410a5306f248b666"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.6/archdev-darwin-x64.tar.gz"
      sha256 "2c083937ec7937736a33c4395cf3ebed7949973bfaf75e8e327f543c6a6ee22a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.6/archdev-linux-arm64.tar.gz"
      sha256 "a0323e8f84566d09485576bbec365df325a2fb8d3870769dcb87d00ac369f7d4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.6/archdev-linux-x64.tar.gz"
      sha256 "59cb0711b9f1e5da3f03adf298b05ff73d641d4075e4624f83cae6bf3d914d38"
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

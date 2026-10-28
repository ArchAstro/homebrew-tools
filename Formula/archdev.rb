class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.7"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.7/archdev-darwin-arm64.tar.gz"
      sha256 "29791fd4f70620c9693e04b311e4cd94af52fc4b998c79f74340afec906dd1dc"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.7/archdev-darwin-x64.tar.gz"
      sha256 "9d6181fba9661a2c1a1d1049c5d02eccd5ca08db8ee1c58dfa63efbf17b61765"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.7/archdev-linux-arm64.tar.gz"
      sha256 "f9951044f3798ae10bfefcc84989b368a4c734595410cf3d3af50183865478e2"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.7/archdev-linux-x64.tar.gz"
      sha256 "a1e5ed2fc92660356e0bbe03ec798ca226140f33ac12b112b8a271573a8bf1a6"
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

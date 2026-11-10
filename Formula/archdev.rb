class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.60.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.0/archdev-darwin-arm64.tar.gz"
      sha256 "71e238a34dae92184b6d0260fd8a125cdac78fbab141e3fc1d44bdcf335d4c45"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.0/archdev-darwin-x64.tar.gz"
      sha256 "e0867e50a5c4e5a41867d3ae65efbd72a000908794cd2b2924d26d5b5e4ed952"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.0/archdev-linux-arm64.tar.gz"
      sha256 "0cec9af1d652cb09a117537198f834918dc04ae0da0426679152a5b053b6e0f7"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.0/archdev-linux-x64.tar.gz"
      sha256 "1df3aeaa4158cf346969d836d89df7647599d22af20570b07ce94716fb5dac07"
    end
  end

  def install
    bin.install "archdev"
    doc.install "THIRD_PARTY_NOTICES.md"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.12"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.12/archdev-darwin-arm64.tar.gz"
      sha256 "dc8478b8d4cb59f86c976082ae91935d3f919feebd76494ff5380181660f72d8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.12/archdev-darwin-x64.tar.gz"
      sha256 "c2c8a74315b21644fe4a84f2fd4d5a0b74ddc5de876901b38e4cf756d174fc80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.12/archdev-linux-arm64.tar.gz"
      sha256 "9bcf91579237771960b1097235139ff4aa9c102c57d1146f57852f3027f23589"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.12/archdev-linux-x64.tar.gz"
      sha256 "baa91dd29bb78ff5598575e418839388c9ce6eaf6fdc328f854a363f92d45016"
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

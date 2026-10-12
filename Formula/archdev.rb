class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.51.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.1/archdev-darwin-arm64.tar.gz"
      sha256 "2ea298ca9c06bd6a9eccb9d10c791762e5b3da9986b88da20fc6df23014b5382"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.1/archdev-darwin-x64.tar.gz"
      sha256 "2be5f89ba1daf30c47dfad6248ea82aec9df36acde2d080eae102130d2c9fd37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.1/archdev-linux-arm64.tar.gz"
      sha256 "2c3c4ed4662c954a831b45f08973cc35560cafbbc6d8464b00b5d2f15d231f52"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.1/archdev-linux-x64.tar.gz"
      sha256 "ed86329a52b615c248217589e6b1749acc5ecd0636fdf1a2cf8334f7ccc79a02"
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

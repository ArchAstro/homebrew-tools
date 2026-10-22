class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.16"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.16/archdev-darwin-arm64.tar.gz"
      sha256 "bdb2326626164b3d8594db14ffd577155e66d630b49de8636215cf440813a82d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.16/archdev-darwin-x64.tar.gz"
      sha256 "425047ca47d3f34b6d52cd02b23756bb436e7a32c9b70442e357952f1155115d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.16/archdev-linux-arm64.tar.gz"
      sha256 "fb2197acb6e3414f8083bb4fd32320d911172a4e612ab45ccb080e3be8c1bc38"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.16/archdev-linux-x64.tar.gz"
      sha256 "60275420c94f0c9fe9d269bd9a2076485c29934c2bb7a4d482ac2dc7afbf6bb7"
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

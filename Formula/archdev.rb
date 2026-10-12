class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.52.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.1/archdev-darwin-arm64.tar.gz"
      sha256 "247ffff95dda8c4e9f891c1d3d7d19bc77133b7c7cac885a0645483a55a02a3a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.1/archdev-darwin-x64.tar.gz"
      sha256 "f1262458ab84fdcd5dd48a3902493d35c8a91b3b0fbfd2cb6a0317f00b7eaf68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.1/archdev-linux-arm64.tar.gz"
      sha256 "28ef2dc445d5f4a5517b58df201b3dfce14b533b4db1d9674acb89c021917671"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.52.1/archdev-linux-x64.tar.gz"
      sha256 "868e096a7089dfa1c87356b2ac18c3020f12c4f96fc2ef263cb293f54890290c"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.1/archdev-darwin-arm64.tar.gz"
      sha256 "6fb9833f2fbd936c69718dc2369a6e62b55db0bebc5776a9eff7d16ce9cda0f8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.1/archdev-darwin-x64.tar.gz"
      sha256 "68d4dff83d901c30de0a40e46262e44c239a06fd1e6d3909a00c3fe35d97360d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.1/archdev-linux-arm64.tar.gz"
      sha256 "44c62c86e04639b68494660f11c481e280570c31a56ee437102d4b2aebbee303"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.1/archdev-linux-x64.tar.gz"
      sha256 "31da85a031b76a58759932b5da7cd22936ff3469a402575f758f562ef57fea11"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.6/archdev-darwin-arm64.tar.gz"
      sha256 "161051354673d3175ea3920a50314692a5b0c9473b3c495f1f9d19ef282682f7"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.6/archdev-darwin-x64.tar.gz"
      sha256 "d470365b925f56146b6958e0aedcacb4580054c0bd3459b2a5e4ece7b0357c95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.6/archdev-linux-arm64.tar.gz"
      sha256 "316bc858b9e69bd5976d8a1aa47807f06a597064bf6cb735eec8383ca6b1ca1e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.6/archdev-linux-x64.tar.gz"
      sha256 "f7167390556ff5218e599b7988073ab6ccd88172ea2ae3311ff51c00dc971c1a"
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

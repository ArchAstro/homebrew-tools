class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.9"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.9/archdev-darwin-arm64.tar.gz"
      sha256 "3448e4301d9f0753b2d9a0ff9dc505aaac77c160cab0d038e0a6f23501d21dc3"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.9/archdev-darwin-x64.tar.gz"
      sha256 "50e080ee5903c9476da3e749d048ef70a9dcf8f7e9214c1e16a8e952f2877c11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.9/archdev-linux-arm64.tar.gz"
      sha256 "114e227a93e79cab6a0b03efbc4b89f3c87f67b5e4d22172158ae35b5f525f94"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.9/archdev-linux-x64.tar.gz"
      sha256 "21b29b2a0ab2452a5656f64d1c33906df94223dbb168e8de184ff08a6af24b8e"
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

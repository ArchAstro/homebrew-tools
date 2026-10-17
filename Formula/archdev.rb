class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.1/archdev-darwin-arm64.tar.gz"
      sha256 "e717a0d89ce8bdfbca4c677c01ef8a39325e1d51fe1935f905eb04bbb73b951b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.1/archdev-darwin-x64.tar.gz"
      sha256 "db45a6e6efbe280953ce7daea5eab2a0149e639768525a08052b8ee385678148"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.1/archdev-linux-arm64.tar.gz"
      sha256 "fe344d22136cd77c81f88b132ec21ff227dab72df12fbda3ccfcec39793e10e6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.1/archdev-linux-x64.tar.gz"
      sha256 "f1b0c154d40828d41e977bbe2ccc8a038431c6274856ed0aac01c3e23767ce28"
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

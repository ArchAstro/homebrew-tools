class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.1/archdev-darwin-arm64.tar.gz"
      sha256 "fc34b5090326eacab4b2b35c6ee18cf913fb70b4c4a7ebc6525e74e315003888"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.1/archdev-darwin-x64.tar.gz"
      sha256 "62f349b54f9196b79f99a789d6a9c272deaa5b109f8ce91e4c09e766d273c2bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.1/archdev-linux-arm64.tar.gz"
      sha256 "3f16e6542438b2c4dd0d3d437cdb67df479bfaf3a560971e4e7e07840151c1b3"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.1/archdev-linux-x64.tar.gz"
      sha256 "c1d64dd6d711ad742b3bbfc64f38afbe6788310a298d1c4fe8916d2dcb1e5c1e"
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

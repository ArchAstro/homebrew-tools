class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.9"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.9/archdev-darwin-arm64.tar.gz"
      sha256 "685cf465196a7bf34dbf9e72596b8d1e7575563b101dd80daa7e10873f51860a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.9/archdev-darwin-x64.tar.gz"
      sha256 "aea166ad61f12c4649594cbf0b41f1510667d70bac3e58b3b84a63ae6a5cbc4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.9/archdev-linux-arm64.tar.gz"
      sha256 "1f610d48879424a762e558b06764e8dbb997c539c43742fdd5f97b785f3961a0"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.9/archdev-linux-x64.tar.gz"
      sha256 "11e4c15c48bfb3925e4af1ed5d867b69b6c19d5507f8cb9c552d6cfbd4746ce4"
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

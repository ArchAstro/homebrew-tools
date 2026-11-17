class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.61.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.2/archdev-darwin-arm64.tar.gz"
      sha256 "86a2031139de93f73d00d465a24a1d0ddc6372200747631a00af443b7a0bafb7"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.2/archdev-darwin-x64.tar.gz"
      sha256 "249d15078e1a0ad5a9d1ab1292e834380f191cea91453675494ce8fc4166a7f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.2/archdev-linux-arm64.tar.gz"
      sha256 "86fa97aa1788a8e3a52755c9d721966d9862ec6cf319564ce0fae5e87737d70c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.2/archdev-linux-x64.tar.gz"
      sha256 "6bf3b7e23647e7a3adf6ccd58248870baeef22bb33565945b08de4bb97fea14e"
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

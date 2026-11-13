class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.61.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.0/archdev-darwin-arm64.tar.gz"
      sha256 "309f4451fd878c9ed59e158a2be62e576fcf9338ddaaa22545a964060e3d8a8f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.0/archdev-darwin-x64.tar.gz"
      sha256 "82e1d7a2a01ab9abef07ff1de06f6405944fe4f031c804765ce8b03e97423b1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.0/archdev-linux-arm64.tar.gz"
      sha256 "0af1a4d6262fa4689600c817a39c9ac71209dc148458dd18bd1bff60aac94dc1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.61.0/archdev-linux-x64.tar.gz"
      sha256 "41279cda0f2323c6c711819d25314f498a8c2fc2af46f300a421b649d4cf5cb4"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.58.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.1/archdev-darwin-arm64.tar.gz"
      sha256 "d419bd6dad5e7356557f100c8a67e2c364cd360622b7a929eaaccfd4cfa4f523"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.1/archdev-darwin-x64.tar.gz"
      sha256 "76c67f9cee867cdfec147ad496bd2f29df9f6f3771984786341627969139d20b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.1/archdev-linux-arm64.tar.gz"
      sha256 "ff0c81dfacabb5ff556f30b992f52055f580d93117d849fd2aeb5b0f2eb42ef8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.58.1/archdev-linux-x64.tar.gz"
      sha256 "02327e368ae324b071186f44be7ac3bddd1d108b33668bf675288a4cc140c36d"
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

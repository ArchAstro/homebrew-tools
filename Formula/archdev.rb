class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.14"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.14/archdev-darwin-arm64.tar.gz"
      sha256 "1cf9154647711d1d65807d2fdfad154afd0e00cdad6be30d69b197ef2880ff9c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.14/archdev-darwin-x64.tar.gz"
      sha256 "0366c0e907e904562424ed581524c6e60795a78a7402c65c27347a5b118a2744"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.14/archdev-linux-arm64.tar.gz"
      sha256 "d5c6f08dc6d4e548630a6285842b5c26504ff68af3d7cb7ac1672ecf371d6f31"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.14/archdev-linux-x64.tar.gz"
      sha256 "1fd3fc60a818040d89549922b27ad21c3e837956cc80e3da18156451e78cabab"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.59.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.59.0/archdev-darwin-arm64.tar.gz"
      sha256 "e92435e5b70898c20bfbdfddd15541be56d73fff5362a2ab41452a81ff000f21"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.59.0/archdev-darwin-x64.tar.gz"
      sha256 "43134db0e59448c29fcc39eef8782093c16063348ff30deb15a1e37a801f136f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.59.0/archdev-linux-arm64.tar.gz"
      sha256 "16ec90c81026dec4c9cd334c2262df3f98c6092084dd8bd0f329ab70e7151ec7"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.59.0/archdev-linux-x64.tar.gz"
      sha256 "0524e7803271077d96dd4c40ee0520cc70ecf949821f11e9e5c4b9957ce188b7"
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

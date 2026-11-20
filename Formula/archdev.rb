class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.6"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.6/archdev-darwin-arm64.tar.gz"
      sha256 "9f55f045fe7c8ef2aa48805a45afb732bc702a06c6b09932b7e6d6757a930aa0"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.6/archdev-darwin-x64.tar.gz"
      sha256 "a7fe32329b49671c34e8252936a394f2353bc28332341dcb2c7ca66ef13fd6ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.6/archdev-linux-arm64.tar.gz"
      sha256 "45cbd4f34328e89432c8949d0cf3e7cbe528d503a5c55f0dc663cadec0045a0b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.6/archdev-linux-x64.tar.gz"
      sha256 "b89804a33e328fe55a38a7fd6f527fffb5f06410234ad5b1fa93cd4e6f52974e"
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

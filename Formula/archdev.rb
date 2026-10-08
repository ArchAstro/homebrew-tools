class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.6/archdev-darwin-arm64.tar.gz"
      sha256 "dfaf40e640c8f5de45a16f12e8817f829447cf7eb3da487780f0ad4098c2b80c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.6/archdev-darwin-x64.tar.gz"
      sha256 "a21922744edfba5b5fc7ca84a7f9272c44902f80b2277877afce8c3fa699297d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.6/archdev-linux-arm64.tar.gz"
      sha256 "77d0b21b5898be16ef13c6ac145a8d2e07ebd830265da0245fc5871639ad580b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.6/archdev-linux-x64.tar.gz"
      sha256 "5ad02cc00bbe1a7e1cb8cc32cf9c3bdda907ce51db2fc432fe13bd01f67d9c57"
    end
  end

  def install
    bin.install "archdev"
  end

  def caveats
    <<~CAVEATS
      archdev is the Rust build of the ArchDev CLI. Earlier releases shipped
      the TypeScript build under this name; it is now the archdev-old
      formula (`brew install archdev-old`, binary archdev-old). Both share
      ~/.archdev (settings, sign-in, and the local daemon service).
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

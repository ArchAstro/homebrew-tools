class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.3/archdev-darwin-arm64.tar.gz"
      sha256 "778776b52ef8500fbc465bb7aaaae653b64cda77a1470af14c65600a52b1ea03"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.3/archdev-darwin-x64.tar.gz"
      sha256 "2b1d4a892c5ced00cb3ab3971ea8ebc4858b72ccbdc460daf4f8e89adcc9e344"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.3/archdev-linux-arm64.tar.gz"
      sha256 "69871715d1b594a24a606cfd7e8821d56457e66b439ac9ffbe9f42b3cb207056"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.3/archdev-linux-x64.tar.gz"
      sha256 "ee87e1a4aea8534a514f5367c1e8675949bf7904d14c0e1831da05f731b7b85f"
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

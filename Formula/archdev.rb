class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.2/archdev-darwin-arm64.tar.gz"
      sha256 "86c9edc39b8cf29c08226b4ec30b9c2d1f5d8745355badf62ea8a7de9cec1d89"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.2/archdev-darwin-x64.tar.gz"
      sha256 "20ed8c0c1a9f4cdf410564a465303bfbf36247d366e4b5c64cfef83a26c7f780"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.2/archdev-linux-arm64.tar.gz"
      sha256 "cb941d9f1d6083cfd45716629aa7b3f7cfe6115fe10eb5f6d394282561eeb325"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.2/archdev-linux-x64.tar.gz"
      sha256 "870da44fade6e4fc82f23e9c136a6bf9ecb7bc6e49a848162a3837a8925b5dcf"
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

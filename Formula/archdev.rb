class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.0/archdev-darwin-arm64.tar.gz"
      sha256 "7b81fe260e64011d2fd84229aa65a6998044c174681a25a571d1f5829d850c95"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.0/archdev-darwin-x64.tar.gz"
      sha256 "9ad2110ecc11f4ed8580b9bbb14998c2f2f659d645e261641a1584a619bf8c7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.0/archdev-linux-arm64.tar.gz"
      sha256 "06f4867f52e46fd140a278da027f0cfcb8957157bf491bf9df2feaa8a4a3486d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.0/archdev-linux-x64.tar.gz"
      sha256 "904dc2f6b6bd50596a1a8898b61a170cb58badad45059bb0f92adda0a1946375"
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

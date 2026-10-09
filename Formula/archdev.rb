class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.2/archdev-darwin-arm64.tar.gz"
      sha256 "252d1044d90b8a7e7c264956d3f496abe456eafa3b8503f4e53218477dd483c1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.2/archdev-darwin-x64.tar.gz"
      sha256 "0c49ecd27b683f1f1ff3e03f6370f1470de55ba76a067b8ad5c51f7b240357d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.2/archdev-linux-arm64.tar.gz"
      sha256 "9d23d8a896a32f22f9f79e5e904b8ba0cf4592ce4ce156c37d81445ece21dfc5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.2/archdev-linux-x64.tar.gz"
      sha256 "fcf7763cb03add229a44ea703585075b4de658674c1058c393a75ce310b6f5a2"
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

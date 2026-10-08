class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.5/archdev-darwin-arm64.tar.gz"
      sha256 "d0eb56d0d59954ad2349ca33e7af0372a213eb40d02a45e5d7fc5d720e5261ed"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.5/archdev-darwin-x64.tar.gz"
      sha256 "370300a20f39c1a62a93481a4336658d6c179da40d20aaf97f54ed7199378c0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.5/archdev-linux-arm64.tar.gz"
      sha256 "af0b6acb942d2577bed22ff8123b901bcbef83b931124d03b468655f6bbaf57b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.5/archdev-linux-x64.tar.gz"
      sha256 "2800dbcde2f737afb20475c7c198acca202e490647aacc9f04a815aa0c7d8f47"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.0/archdev-darwin-arm64.tar.gz"
      sha256 "9a7b473675212078477d484d0c4e43264d09713dd24aa63db5d108655e841e0a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.0/archdev-darwin-x64.tar.gz"
      sha256 "32d5a0eb834226194b078d4033615502210d214df4c98e0f8fbcc1e8094ae066"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.0/archdev-linux-arm64.tar.gz"
      sha256 "60b720d4f52e8e6a3343e5664e7680ff1c2c76c978688bcbda664c1e799c3232"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.0/archdev-linux-x64.tar.gz"
      sha256 "ba92fbe38c384a4e7e22a53ca2312c4164e46dc3099ce9c4fa21a9393895859b"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.4/archdev-darwin-arm64.tar.gz"
      sha256 "79737e4f9451f40f0a3862a96ddc426dea2a72505ab01a83b1eb6074c95d8887"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.4/archdev-darwin-x64.tar.gz"
      sha256 "8fb24ce2e620e7a93bd63f2eba1ceb1c0a20caa91dd7c227707712a03072f315"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.4/archdev-linux-arm64.tar.gz"
      sha256 "b90298dff8aac4604926c4372ca6d35c1410a608ab7cf6621ac0cde4a036539e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.4/archdev-linux-x64.tar.gz"
      sha256 "6cb5eff736bfc9f4c57c6113a5dc66f1e3f7f055e2ae336b21bb65fb184fee1a"
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

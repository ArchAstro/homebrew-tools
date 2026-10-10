class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.50.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.4/archdev-darwin-arm64.tar.gz"
      sha256 "9524b9faa7c148fd6876d7c666212cdd22afaa4f5d4bfd31eb8ce292f49abb60"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.4/archdev-darwin-x64.tar.gz"
      sha256 "1885075b2ac6c9cc8e8f8c6c578646e0fdcefe579f6ca8fabdf56eda2e5333f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.4/archdev-linux-arm64.tar.gz"
      sha256 "e100a6ff446f8d9d20f40b2d52a88296ae6851f2da22481e13d946f7062116f5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.50.4/archdev-linux-x64.tar.gz"
      sha256 "4d08a6ed2cd2488856430e4fa4470412522c1e5a47c4de6cf132ba921b369d89"
    end
  end

  def install
    bin.install "archdev"
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
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

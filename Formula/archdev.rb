class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.4/archdev-darwin-arm64.tar.gz"
      sha256 "095fb35a47f93966a06456d863f44fa4791f23f123acb1101603af7356fe5846"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.4/archdev-darwin-x64.tar.gz"
      sha256 "fdae47a6960c0661a054ba99711946353d1fdb144c3d0850a6ab60880e6f419a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.4/archdev-linux-arm64.tar.gz"
      sha256 "c0717997df27188345cd10c32ec121293aacf8f7eb1d18419718c1e8a902dc93"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.4/archdev-linux-x64.tar.gz"
      sha256 "2a2a55e95c2b2375008444d6c3181d3ca43ce2bd1b8f6d8e835af636d4400dd2"
    end
  end

  def install
    bin.install "archdev"
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
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

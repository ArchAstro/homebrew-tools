class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.10"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.10/archdev-darwin-arm64.tar.gz"
      sha256 "b14666ec6852ad373962b5d2c0351e666b0dfc0709a71f8475a7105f357b15f1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.10/archdev-darwin-x64.tar.gz"
      sha256 "cd4bdd2d454965c5e0456c75840b398f0b096893db195edcc19879b080496cd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.10/archdev-linux-arm64.tar.gz"
      sha256 "04bc795a0105a44dab3604b0918ee1464970ec86f7ea7466898e7082916fe763"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.10/archdev-linux-x64.tar.gz"
      sha256 "e5fd1981d43d48c1e6423094cf351a50d507517be70654b50f98ed87b5ce4960"
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

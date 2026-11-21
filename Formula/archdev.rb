class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.7"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.7/archdev-darwin-arm64.tar.gz"
      sha256 "781051eab5924a87f6ce5b3bf58d4f1ec1a770421b7ba3a057baf90b7598af6f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.7/archdev-darwin-x64.tar.gz"
      sha256 "bf8a0e455ad00216a2f5af930dbfb054f7bd30624a1a79f01c9f992d523df78a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.7/archdev-linux-arm64.tar.gz"
      sha256 "60f75ad636df5081c196907cf098394dad724b588cbdb2a4f073d36a41a1d5cd"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.7/archdev-linux-x64.tar.gz"
      sha256 "4799cc0a2a6c7c28871f6faa6a903bc69aa20d6233be7d111846c054a6ff341e"
    end
  end

  def install
    bin.install "archdev"
    doc.install "THIRD_PARTY_NOTICES.md"
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
      The first archdev command you run in a terminal also installs bash and
      fish tab completion under ~/.local/share, where shells not installed by
      Homebrew look for it. `archdev completion install` does this on demand.
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

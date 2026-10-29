class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.8"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.8/archdev-darwin-arm64.tar.gz"
      sha256 "22feb9e2f4f31e2e8902da0150111cf74b987cad4881bea0a8872019f09ae2c3"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.8/archdev-darwin-x64.tar.gz"
      sha256 "c245c0ae41ca292a669e2ba998097ad0397e4b92d2696d76e8d2f366a7f386cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.8/archdev-linux-arm64.tar.gz"
      sha256 "85c9018c8001f6ffef2a8786b298de591bbd982ae8c374acfd495eda1c1c6c47"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.8/archdev-linux-x64.tar.gz"
      sha256 "b8372372a313ae8b9c808494d6c6c266337c61249c8355d7b3bbb3c3de04039f"
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
      The first archdev command you run in a terminal also installs bash and
      fish tab completion under ~/.local/share, where shells not installed by
      Homebrew look for it. `archdev completion install` does this on demand.
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

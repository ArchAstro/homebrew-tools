class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.6/archdev-darwin-arm64.tar.gz"
      sha256 "40f047a702f096a802148825f6185b360f2521a0f4b5d43156a0adfcf23b9b9c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.6/archdev-darwin-x64.tar.gz"
      sha256 "0b5285e3d4249bd772cc1208253e0fbf9a506bae4f66151ef77aa16e6620bd11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.6/archdev-linux-arm64.tar.gz"
      sha256 "0c2f3cc2580957f8e131b32ba4f0afbbb3dedc7d57b74af0e4c17d830e189b02"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.6/archdev-linux-x64.tar.gz"
      sha256 "dbbfc73de2530ee4a195d72c496ba2192be6c709d269e4dfa6ab3b2da6fe3673"
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

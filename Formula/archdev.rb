class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.1/archdev-darwin-arm64.tar.gz"
      sha256 "f9841339713252c4c3455ef435c83d30a6d38a7227600480526844f0bf2bf55c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.1/archdev-darwin-x64.tar.gz"
      sha256 "61e7508714c0db6bf9930e298eded467c29aed30ebe3c8dd21004e64baf3faff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.1/archdev-linux-arm64.tar.gz"
      sha256 "5acc578ae3aacceff316b0d8cb9e1d983c94c9ae41de59bc2dd2a47960b9f37f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.1/archdev-linux-x64.tar.gz"
      sha256 "5f959588cf4bc37cb21322b209eeb183bb362be5d8282141b2df0c229358a093"
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

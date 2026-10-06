class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.1/archdev-darwin-arm64.tar.gz"
      sha256 "72b0dccd9904b65bd32e53bb4ebb782abd1bbc83d8eae837e324ae2b953a7e80"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.1/archdev-darwin-x64.tar.gz"
      sha256 "fff22adf50f84fb990a00a3ea3d40f7df9376148d6b8e91db87bfc62706adce5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.1/archdev-linux-arm64.tar.gz"
      sha256 "617a489fd38620e0bc73c0614b044a7227178940513a9753b311f6370f779dae"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.1/archdev-linux-x64.tar.gz"
      sha256 "6b70061ced35177dfcf93bc7fd62dd9c342078a8eaf749d9bfa8947cb7c9c604"
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

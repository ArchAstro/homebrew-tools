class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.0/archdev-darwin-arm64.tar.gz"
      sha256 "5ea408bfe115a45c33a12a94127543d874e768605e535bc5a2de1ae412e27465"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.0/archdev-darwin-x64.tar.gz"
      sha256 "a3b9c7b31c7273d65d59f2efe31ca98bab7ad71fcb613112d805012ebd746522"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.0/archdev-linux-arm64.tar.gz"
      sha256 "a24ca68f19b4f8ffb3c65bbc33b7e1ea80dc74741da4428d4d958d554d00d400"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.0/archdev-linux-x64.tar.gz"
      sha256 "a324e764a1a478b78cffdcd91b9df71a39df816cc96ae447e7a4c5d4f18c251a"
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

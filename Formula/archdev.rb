class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.51.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.0/archdev-darwin-arm64.tar.gz"
      sha256 "66bceb04a71d2559a84865ce6b2c3e3c5067dd24619fd0b7230fac88d4d4a1c1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.0/archdev-darwin-x64.tar.gz"
      sha256 "0b5a647f58d27ad6c37e86029b230741d9b8b637d2f108920239133922ce6b99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.0/archdev-linux-arm64.tar.gz"
      sha256 "3bcb3f9e22884deae64783cab1759b7b998872acd9b8113bebdbb1529e9f6fb5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.51.0/archdev-linux-x64.tar.gz"
      sha256 "5b8c39ea4b80b541b4d470ef56ec7115a36c1832742d03ce871f2dc7160c9c0e"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.53.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.0/archdev-darwin-arm64.tar.gz"
      sha256 "dd105496355d7eb4bb0b8ef912f5deb2c645709eb251005c97df0b0a26a02c84"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.0/archdev-darwin-x64.tar.gz"
      sha256 "094224818ab6fdec91e6d6dd798bb4b7ba6640c9a9a03de42a34fddfd8692aea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.0/archdev-linux-arm64.tar.gz"
      sha256 "9fbe08a78d3da397e946744e4df1517e86bad0e603eef31a4a91e5c36b0a8c02"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.0/archdev-linux-x64.tar.gz"
      sha256 "cd1c1c3416ee04c0906536810f8643365db718dcebd69c796f996d55fc6d528d"
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

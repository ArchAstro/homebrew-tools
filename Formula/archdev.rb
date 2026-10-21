class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.11"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.11/archdev-darwin-arm64.tar.gz"
      sha256 "9a14f8a57c5f52242178b53b24e5c288cc1e2db374fdc5f42098768d2447b40b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.11/archdev-darwin-x64.tar.gz"
      sha256 "15a8366cf16d7f9eef284533e26de5c0c739c86959ae324d2c3cdc641e7669c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.11/archdev-linux-arm64.tar.gz"
      sha256 "134307c986741141f0bf978c22f388893c1577346325ce1676d9bfc35af42885"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.11/archdev-linux-x64.tar.gz"
      sha256 "4dbf49c8f9804803bf1a6f107a045b1fc80f895878d786f4d3b201a7a818c87a"
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

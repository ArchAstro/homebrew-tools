class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.8"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.8/archdev-darwin-arm64.tar.gz"
      sha256 "2a6dab01bbac9d1410dadf9c4b25d23ea5ba4ffaeebe0956888492a65c20100b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.8/archdev-darwin-x64.tar.gz"
      sha256 "ff134fae6eec7e1834832432b52e87d7e8eae0c27698214cd7165f093e66b998"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.8/archdev-linux-arm64.tar.gz"
      sha256 "5a06a521121b07931a012abd2fddf1174fdb10dc8f3e169cae4a8ddb9b59c05b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.8/archdev-linux-x64.tar.gz"
      sha256 "ab34a62e057f0665b4cb1368eb7e7ffba53b2a04440480779e7701244cd5479e"
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

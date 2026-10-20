class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.5/archdev-darwin-arm64.tar.gz"
      sha256 "ca3a6e6590cc9feace07788b999eddd8cff23e3ffc6d182fb85073bd853aa541"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.5/archdev-darwin-x64.tar.gz"
      sha256 "7038b0329d58f8c12f9e51320bf26530b38f504042f2b81f981b340b12b93af6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.5/archdev-linux-arm64.tar.gz"
      sha256 "6266c481bd7eb2ec8dcf381e9b754e4861327af0557d5347c8d6cef56ae7a61f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.5/archdev-linux-x64.tar.gz"
      sha256 "c52f387b71bce1ed71eaa01dafe9bce7397f4376fa2b3c794659c0ec078f700f"
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

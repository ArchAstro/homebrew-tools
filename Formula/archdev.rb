class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.55.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.2/archdev-darwin-arm64.tar.gz"
      sha256 "0e55407d4f6e1327b0128941a9732525f49fba94ce31ed72066b6cec50a203a4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.2/archdev-darwin-x64.tar.gz"
      sha256 "8872826407f5b9e65422f8d8b663c73849f7f5ecd63a31bab0b1759c79d46e53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.2/archdev-linux-arm64.tar.gz"
      sha256 "eefe8a2792d6e5adfe86c0c258aecb0efa397b2a00f3b4e577ddb3f7a7738c54"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.55.2/archdev-linux-x64.tar.gz"
      sha256 "6676c45aa6950d852e45fd1a4a0d27c4a82dc2e1a7d905e97305e4a6d166fdeb"
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

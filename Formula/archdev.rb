class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.53.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.1/archdev-darwin-arm64.tar.gz"
      sha256 "b41bf8d84cb8eda045b2e9c7037ce972db07b8d062e7243cf81f13f23841652e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.1/archdev-darwin-x64.tar.gz"
      sha256 "ed741082dcf78b2036a59f8d45a497192e445a11d678df32ac36d77beb6fa8db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.1/archdev-linux-arm64.tar.gz"
      sha256 "f60064601c8780599442b0b61afa9b8e0e19717965245406367899b685541012"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.53.1/archdev-linux-x64.tar.gz"
      sha256 "7cf7d6c0c11391ab68e88b15c6921552ac868b7ef28df5f83d6716af777ddc1a"
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

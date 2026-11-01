class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.56.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.3/archdev-darwin-arm64.tar.gz"
      sha256 "9a49e4e976d04ba42e4565fedeb6145146b15623d18d01e81bcff6efdddfdb42"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.3/archdev-darwin-x64.tar.gz"
      sha256 "8b53754b4d8fe1ae2eaf8fe8fdfd1feb53858b8d5115accd82acdcc3b3d425a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.3/archdev-linux-arm64.tar.gz"
      sha256 "4a0068c062727adda4ccdf86929a8a0d9f64e48e2a87fa40c5d91e18b53d40c1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.56.3/archdev-linux-x64.tar.gz"
      sha256 "f1a35b628093c1d0384b27e9bc717cb891ab9a46603dc5ec5b462ed0c4f50aee"
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

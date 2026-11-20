class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.4/archdev-darwin-arm64.tar.gz"
      sha256 "e41f1f717aa24fd4c552f9610ca4612be3f5898a7a4676502d018149c96f38a4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.4/archdev-darwin-x64.tar.gz"
      sha256 "b8bee2d5ec8cb6fac242cbd9842eba31fa79a291e0bb9e358b36f6a253f4ee45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.4/archdev-linux-arm64.tar.gz"
      sha256 "eb19542f3fcd8b6b42ab4e47f54561c779439263690da712ec44bcf3fbd780a8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.4/archdev-linux-x64.tar.gz"
      sha256 "c8511ce452081893a2be5abfa21c725c3e4d1a9f94e3dc31ed90ad6e1b17294f"
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

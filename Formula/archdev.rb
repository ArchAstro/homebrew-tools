class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.60.7"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.7/archdev-darwin-arm64.tar.gz"
      sha256 "a3e6a7ccc106ece58300e6cbda036f22da24638bd4711849dfe159243f8ee4c6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.7/archdev-darwin-x64.tar.gz"
      sha256 "8b3a5618dd5cfd0bc8a3ca09afc962dbd1b0b6dcacb2f89a956bb86fcc120756"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.7/archdev-linux-arm64.tar.gz"
      sha256 "c62ea40ad351e1c8302f7ebb603d02c3d90b039e9de3b3c23a4b80b621b0e9ed"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.7/archdev-linux-x64.tar.gz"
      sha256 "4ad474c18333a9db9f55cafb3a6a163f2506776d3eb42e95969e27af56a3eb2f"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.62.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.2/archdev-darwin-arm64.tar.gz"
      sha256 "224a0cad625c3de577756895004079c9267b4f9f2f2101897289806e109094ae"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.2/archdev-darwin-x64.tar.gz"
      sha256 "55043b54663af6dda66aa8c04a91f03eabacecaf23bc7100a60935d171bd22e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.2/archdev-linux-arm64.tar.gz"
      sha256 "3dbddc9b3da3f6804b315e8043132713980ca1c2a0d6b0cc87720e2a5db69b32"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.62.2/archdev-linux-x64.tar.gz"
      sha256 "63bb4f6446463c0e3742bdc4fc7bba9cdc44a058a2f496ab9571a502f58ef037"
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

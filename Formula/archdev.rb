class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.54.19"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.19/archdev-darwin-arm64.tar.gz"
      sha256 "85d56674b500dc8ca606ccb238382737b683309dfa00a65d1f05a498b3948ff0"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.19/archdev-darwin-x64.tar.gz"
      sha256 "f949744f5aef88805129df6fe8d6e509dc08152bb8ae046c4868b2075f985dda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.19/archdev-linux-arm64.tar.gz"
      sha256 "2e1caafec073e177171db7fc7b9f351a52e54fce40ea6652a6c0d72b5517140c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.54.19/archdev-linux-x64.tar.gz"
      sha256 "e452b07213c5844816c03f1876633b8c8041d1e916f71f96cf195d27ae5ef523"
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

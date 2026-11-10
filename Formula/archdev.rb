class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.60.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.1/archdev-darwin-arm64.tar.gz"
      sha256 "bf397c951a4550a1be2e5c193aa1d49ece2c3a9dc8130aad789a23b5469e9c6d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.1/archdev-darwin-x64.tar.gz"
      sha256 "a1640ad49ab9a4900421e3a3a2fbdf114c90afcdf22d7471da60b03c70ae568e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.1/archdev-linux-arm64.tar.gz"
      sha256 "380fed6ee5ff651cdfe7c3e7b9f3e4602e5eee56f0e82f13bbe7a8e8db69f995"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.60.1/archdev-linux-x64.tar.gz"
      sha256 "66f30237f151ee09594e784b06c5663c841afa2d2d038aa12a5961029b55437a"
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

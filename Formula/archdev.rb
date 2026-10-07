class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.49.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.3/archdev-darwin-arm64.tar.gz"
      sha256 "6202637e7f27d0c1ee9f25d98cad60cf7ddb9132cd2cda213b12eaab1a2dea46"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.3/archdev-darwin-x64.tar.gz"
      sha256 "427fa6006eafcde7262fab6ce12d563069d55d70f4e1550152adb04b3b00cdfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.3/archdev-linux-arm64.tar.gz"
      sha256 "426746430d2f2de8d57fe3071eb3ce57914f3a005b12953b89a2dc0d93e26a91"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.49.3/archdev-linux-x64.tar.gz"
      sha256 "ee17b8ef491e92b86961265e0f2aae3548b2146b1db69bd034b32424276bb266"
    end
  end

  def install
    bin.install "archdev"
  end

  def caveats
    <<~CAVEATS
      archdev is the Rust build of the ArchDev CLI. Earlier releases shipped
      the TypeScript build under this name; it is now the archdev-old
      formula (`brew install archdev-old`, binary archdev-old). Both share
      ~/.archdev (settings, sign-in, and the local daemon service).
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

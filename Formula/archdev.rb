class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.1/archdev-darwin-arm64.tar.gz"
      sha256 "890af98ba61ae40873958ea0ecd6a902c92147a6b4be9dd66ccf6da4f7143dcd"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.1/archdev-darwin-x64.tar.gz"
      sha256 "28be73ff87758b16f353e91d68d0b8700037361af23bcb1aa93b756a8b2de669"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.1/archdev-linux-arm64.tar.gz"
      sha256 "7438d22466512422e1029c784f9e53c46f282dfdd61a91512e5538658f8ee683"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.1/archdev-linux-x64.tar.gz"
      sha256 "64da7f4dd14d6440d9f1a27a39102e3856411a4b5ff0ef43ee8b3d9efa2a2683"
    end
  end

  def install
    bin.install "archdev"
  end

  def caveats
    <<~CAVEATS
      Run `archdev daemon uninstall` before `brew uninstall archdev` to stop
      the local daemon and remove its service. If you skip it, the daemon
      unregisters itself within about ten minutes of the binary being removed.
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

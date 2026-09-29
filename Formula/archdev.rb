class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.47.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.0/archdev-darwin-arm64.tar.gz"
      sha256 "2128cf436411e4bd0b1600afe61be365dbd4862ac1376745acefde26bfe9d90d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.0/archdev-darwin-x64.tar.gz"
      sha256 "b7d3f08bc6d39807f7cc9f6b74d5aa9ec44f32065eceabf1a07ae73c1e3565b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.0/archdev-linux-arm64.tar.gz"
      sha256 "b75c7737bb3542bd0b9f420119591ae6d3eb31f4dd899f046d785cf60ed38ff2"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.0/archdev-linux-x64.tar.gz"
      sha256 "3924b8adce70d9bbf468ca63b8b1e2b921ad4b659c26f0248c77d7265f1ad764"
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

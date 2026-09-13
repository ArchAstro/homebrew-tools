class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.40.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.40.0/archdev-darwin-arm64.tar.gz"
      sha256 "0b97adf62e22e0b4a50469729d6c03397191b96b34066fc7304e8ff5196c83e1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.40.0/archdev-darwin-x64.tar.gz"
      sha256 "7d76f3f362111ec538a707a9bd672d88d7bba6d296a4d2661a3522b69eddf5d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.40.0/archdev-linux-arm64.tar.gz"
      sha256 "3dbca150d8c0d49d23600426e8be087aaa7e27b9ae12c29236d0faae3050ac80"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.40.0/archdev-linux-x64.tar.gz"
      sha256 "525cf3dfa4de70186b08a6f2a6a4cbb83d5fb800679315120bc73f411623215d"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

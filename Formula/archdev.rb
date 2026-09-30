class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.47.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.3/archdev-darwin-arm64.tar.gz"
      sha256 "0cfbbe88e0ad93c8bc0387f3de4075e2e66204197ddb18c9b90a7970b870357c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.3/archdev-darwin-x64.tar.gz"
      sha256 "a183cd211af93ef3eebd3ae6ad80bc54892abec77930a61d6f905cb423f7775d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.3/archdev-linux-arm64.tar.gz"
      sha256 "de7c7bf2088632a996f8437bc6f51202c77709faee7c735db0cebe4810993245"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.3/archdev-linux-x64.tar.gz"
      sha256 "08db0657046199e79d4c1b6599ee70d5e33a31b4016478a3702772b445aeed2c"
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

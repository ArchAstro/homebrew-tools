class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.47.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.1/archdev-darwin-arm64.tar.gz"
      sha256 "72c48843e49bcd7aec9ef9a1f906a1ae8afa45e25891ff5f5c109145f55a3d33"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.1/archdev-darwin-x64.tar.gz"
      sha256 "1c14fbeed3b7c77902071be4ca18856b78d36bb195d46d1087aa1fc7758cb67b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.1/archdev-linux-arm64.tar.gz"
      sha256 "cc4cff062c343f4da5d6d453175f682fdb72b461860d3f80a083ee89ecda7e15"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.47.1/archdev-linux-x64.tar.gz"
      sha256 "37cd71cb3b2c28a95dc5d11d80955f9d795f5db19675c075da4a22bd7540fd98"
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

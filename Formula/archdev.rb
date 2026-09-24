class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.3/archdev-darwin-arm64.tar.gz"
      sha256 "07fad8ccef4e486eac584b68df4d11c6224a57586032e8fc964aadc674090544"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.3/archdev-darwin-x64.tar.gz"
      sha256 "034a216c874987c569b8ec415e8ed38177649356cba5a2caae8afa12883d2942"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.3/archdev-linux-arm64.tar.gz"
      sha256 "aefb7e6b7968a5359b1cfc51aa8821c9844137f5effe023a59c300616bcbce77"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.3/archdev-linux-x64.tar.gz"
      sha256 "714dabbd77528ce91176549e79d52c97f406c128e8a9afd44601f2d8ebe84ee1"
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

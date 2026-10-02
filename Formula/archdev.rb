class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.6/archdev-darwin-arm64.tar.gz"
      sha256 "601f13cec420a5ebe32877ec4072b8f9fc11cd6580c7b20e6708ef2dad53f786"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.6/archdev-darwin-x64.tar.gz"
      sha256 "da2a86ef44737751919bf5f0d7b28e5ac634fd080cb62da488dc2710436b6b6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.6/archdev-linux-arm64.tar.gz"
      sha256 "d89eab18b248b82f95b816c99492f44d149939f1ee95ee837ec4dd4bc96e9af5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.6/archdev-linux-x64.tar.gz"
      sha256 "eb4f5002a3a7dd3ab956dc238cda4e98b24155437fb8e8a099b54668f1eca9b2"
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

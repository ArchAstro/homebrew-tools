class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.39.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.39.0/archdev-darwin-arm64.tar.gz"
      sha256 "aac24274bfcc5d3c21fd362ede56cd161667ff3633fba85aee31289a673f8f89"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.39.0/archdev-darwin-x64.tar.gz"
      sha256 "ec07ded207245d642fff9dbc3dbd538bfb707ec4a0715aa0c7bda62bfff15a1c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.39.0/archdev-linux-arm64.tar.gz"
      sha256 "019bbdae06d48b7933ab8d552502d99f47d9914f72517e8f6d7fdb229a3fcf4f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.39.0/archdev-linux-x64.tar.gz"
      sha256 "f34614a30c2188c03c0ef6bc0cb193c6440ab0afecafe102f6b3a669b5f44b45"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

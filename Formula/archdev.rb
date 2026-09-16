class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.3/archdev-darwin-arm64.tar.gz"
      sha256 "96e04bc4378d36ba988af58a8163da44d416802bbfffadb1dad4717e7b9523bf"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.3/archdev-darwin-x64.tar.gz"
      sha256 "138736ff835a1b3cfe06e371c02f044b5c791bdb69e9164c252ecbd08adb63a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.3/archdev-linux-arm64.tar.gz"
      sha256 "c0cfc77fe295ec10fea967aad263d5e6945080a93f29876b408bd90e50dbe751"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.3/archdev-linux-x64.tar.gz"
      sha256 "9e1ce308b4db2a068c57369f49082e38d34a2104ea699168139895e735721257"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

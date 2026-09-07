class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.33.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.33.2/archdev-darwin-arm64.tar.gz"
      sha256 "43b4644e9c57d73d876588feeac4cd9de62938e04d4ad857d0fd519f7b8e8ec9"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.33.2/archdev-darwin-x64.tar.gz"
      sha256 "2ee7f6d622ab23a091f0acb3e68dba0320590f823685031d3d1b75683384b76e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.33.2/archdev-linux-arm64.tar.gz"
      sha256 "36cb20a9eea7829c35a9a2512a48b8c736de5535def4a5e29d9a8fec3001ee76"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.33.2/archdev-linux-x64.tar.gz"
      sha256 "410e66d6ad19fc8636108652713416e1276612b6eb2d2ea458c4e56016622dfd"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

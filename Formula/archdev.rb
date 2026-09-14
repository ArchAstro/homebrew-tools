class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.41.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.2/archdev-darwin-arm64.tar.gz"
      sha256 "9b4ad0cbc20da1e0f432dbe8cd268ad5708e0ddef13ea666053e3377b9465ffe"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.2/archdev-darwin-x64.tar.gz"
      sha256 "1e6721f6f7d462ca181df6018154d54821e5cb6705f3116493e9e9f42d37d00e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.2/archdev-linux-arm64.tar.gz"
      sha256 "de2c2349ff11a86c26b3d9bc8c93bd3dd52f85dbcd02162e9f355ea88c0ba74b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.2/archdev-linux-x64.tar.gz"
      sha256 "af7d24a864245feb502dd5a8392066125995d10ce3f2680d303a23a25d29e84e"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.11"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.11/archdev-darwin-arm64.tar.gz"
      sha256 "7c996473b6bd9c2fed608605031c0b2f6abaf4b1e206b517506650df8a0b8ddc"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.11/archdev-darwin-x64.tar.gz"
      sha256 "d62064af53bc5cda2690e8cb4d5f897df2d203e611f9fa02f7593fb5e762c91e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.11/archdev-linux-arm64.tar.gz"
      sha256 "f4d30e0a5a8490dff0fdb5e3b5f92c66b6b50cd8a1be5a160874551dd4548f58"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.11/archdev-linux-x64.tar.gz"
      sha256 "e7e9da479856d5b351c3d38c36be22f0ed0a88e422a4f5a4c29058016a3cbe4a"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

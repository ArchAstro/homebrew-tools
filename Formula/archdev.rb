class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.15"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.15/archdev-darwin-arm64.tar.gz"
      sha256 "435cfe61318f1576bbf8137f864873cdd3618b783ba37dcf57d178c3f4acdeb8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.15/archdev-darwin-x64.tar.gz"
      sha256 "ae14ec242e1e34025f2b3cf857f945897ab39bd06a81287646f911c6b3b1ac77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.15/archdev-linux-arm64.tar.gz"
      sha256 "e34ddb138824342ab9ad9cc5c668232d207f1c653780c644f4a84325e1d382f0"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.15/archdev-linux-x64.tar.gz"
      sha256 "88d5a7b388eb1519887a4568a1d465db9deefdfc9bbc7c806f574e0c01d29cac"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

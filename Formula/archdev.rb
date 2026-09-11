class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.37.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.1/archdev-darwin-arm64.tar.gz"
      sha256 "632de4a1f0490f4fa9d072b3c0b36fab3e6998fccc70434c8469a7c20199579a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.1/archdev-darwin-x64.tar.gz"
      sha256 "35c33ae099b269ae3c9f75b48937d7539f2d402afaa4437f6984af2b2a55a3cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.1/archdev-linux-arm64.tar.gz"
      sha256 "e5b650a3b890101dcf92e43c238f596777912e1f61220950224fd67d6095a1a5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.1/archdev-linux-x64.tar.gz"
      sha256 "b3434e58c54a8db7ee3f2b114be1dfa1e7e7cf420f788a49af6da63ea2546c54"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

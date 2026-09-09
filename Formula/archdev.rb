class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.35.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.3/archdev-darwin-arm64.tar.gz"
      sha256 "5f0c734da68673943dcb257d5a69ed4cb8911564d7cab8161331e423c5c4df51"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.3/archdev-darwin-x64.tar.gz"
      sha256 "4fefb5d8a0a4570207f4f239bfeefd712c49355d026ab0d6d2313b33deeacffc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.3/archdev-linux-arm64.tar.gz"
      sha256 "361984dae02692c71082045b99a845a46fba0898253f800a76cccdd79e5ea811"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.3/archdev-linux-x64.tar.gz"
      sha256 "2e1dcbd73a2e5826d323bdb5f987ea431297efa8543ebf90a62cdba913dfd7ae"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.32.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.1/archdev-darwin-arm64.tar.gz"
      sha256 "19600fc693c3610ec6882dd70896766e713509f3fd80394f8709738667f6d936"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.1/archdev-darwin-x64.tar.gz"
      sha256 "0f9e684b9e0f6b0c5b4bbc28ecfb849b9cec71b9ef458accc18d2fea70d8fb0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.1/archdev-linux-arm64.tar.gz"
      sha256 "93b1082da6155993e01c6b33fce8c9c32cfff924726351a1248a301610aa4f72"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.1/archdev-linux-x64.tar.gz"
      sha256 "09eb264ceadaefb92091e70bc11e5d8f30f98d898702f5f041c7a991949267fb"
    end
  end

  def install
    bin.install "archdev"
    bin.install "archdev-dashboard"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
    assert_predicate bin/"archdev-dashboard", :executable?
  end
end

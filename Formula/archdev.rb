class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.37.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.0/archdev-darwin-arm64.tar.gz"
      sha256 "9261b98717eb120ff87984f041fb98b058c1bfdcd8f016317d325cc397a6318a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.0/archdev-darwin-x64.tar.gz"
      sha256 "1455c082df0f4a70880ae9809fa0e03185bb04e8d9a98958ca48d2d1f6e6423b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.0/archdev-linux-arm64.tar.gz"
      sha256 "cddae4a9aa98288d820ee67dbb654530a6f63da3fbe062b1df8a7aa3f8490b78"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.37.0/archdev-linux-x64.tar.gz"
      sha256 "e2242012e8fcfd791ef4ff4019b836ad683ccaa0a323dbf74d68a3e9fed2efbc"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

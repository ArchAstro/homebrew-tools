class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.5/archdev-darwin-arm64.tar.gz"
      sha256 "915d13f6df7a54b6e6aba7324939d21b59fc31f06116631f0bd806d99485114b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.5/archdev-darwin-x64.tar.gz"
      sha256 "67100c75a0ae7e1a4dfa3e9cca4307d2acd1c045a517eccec1061a214ea18c7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.5/archdev-linux-arm64.tar.gz"
      sha256 "b7a7d3cb9dc586a0759f301bf27b0443f60e599462a85c319afdb1677d75940c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.5/archdev-linux-x64.tar.gz"
      sha256 "770daec2aa9f8370b1e3c13c314cbf0133ce2a476535740a4d1377ba912745a6"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

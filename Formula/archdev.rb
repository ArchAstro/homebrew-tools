class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.14"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.14/archdev-darwin-arm64.tar.gz"
      sha256 "f21b5baa5c0dda0a2385446add4f3fe5a9123aa5df9ea9a47929f89c3277b24b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.14/archdev-darwin-x64.tar.gz"
      sha256 "62df22d4da1af253f06559c136b76ab28d7d009619a7200c6fc7c151e613e962"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.14/archdev-linux-arm64.tar.gz"
      sha256 "2aca0ca5baf9757c7979bfd3c1a18d622564fc3142add0612c40c37348a1a1f1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.14/archdev-linux-x64.tar.gz"
      sha256 "2345d68ba7352a5c23854840f9fda251b7d4409f50d685f8a66aecd921e93396"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

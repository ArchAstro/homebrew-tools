class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.43.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.1/archdev-darwin-arm64.tar.gz"
      sha256 "b9e88187761386df14befdf42e7cc119180b4c67d9d920faaab42f6d4d22169b"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.1/archdev-darwin-x64.tar.gz"
      sha256 "049a61ccaf145eb62d96e39aac6c4a184d04c5fa9163e94a7e06315d4a29f658"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.1/archdev-linux-arm64.tar.gz"
      sha256 "154436aa323a0621b43a56b7a823b3f2d89e0d3855c9c0fd1ce366557d1519c8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.1/archdev-linux-x64.tar.gz"
      sha256 "9c02c2ebb7db721a352dd6ec915f125c9f55354aea9f26c643e2a9267985d8ef"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

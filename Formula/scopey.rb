class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.2.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.2/scopey-darwin-arm64.tar.gz"
      sha256 "800057120b681196838074630fa686476d4c690a0a06d2a0e2cdc702bab10f1b"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.2/scopey-darwin-x64.tar.gz"
      sha256 "dbb04432ed7435595a0e79cb042b00b5e873dca0cfb1e42e1c712fa8689a0453"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.2/scopey-linux-arm64.tar.gz"
      sha256 "f1d67190fbb9e5ebbe93d5aa2e71d7d26b5f827b184302511f3d3be7d670d682"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.2/scopey-linux-x64.tar.gz"
      sha256 "2567cbec5dfbb2a25dada07d57bbf4866217f31accc40efa19b974ae109d2dd2"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.2.5"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.5/scopey-darwin-arm64.tar.gz"
      sha256 "4009a5a6d7e7a56c7ec33343ee61775ce47b1a3926292a54e8f34d5163d4978c"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.5/scopey-darwin-x64.tar.gz"
      sha256 "055ad7a8d464cba8c3c369d46f20513facaddd3e5a6f4623b9aff3a2aa04cc13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.5/scopey-linux-arm64.tar.gz"
      sha256 "f6d3e7978d2493d7d64b4d31a4782f049b5eb799a4f89d507e79091bb378ae92"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.5/scopey-linux-x64.tar.gz"
      sha256 "3510a8c97da7236397c84be11374d6724017ffc87d82176e20bdd2c14e8bcb51"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

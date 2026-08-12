class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.2.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.1/scopey-darwin-arm64.tar.gz"
      sha256 "27c03ddb97a3dd9d1d19257c0c8c2968eaceb1fe446abbcd144e38999443374d"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.1/scopey-darwin-x64.tar.gz"
      sha256 "ca4241b3d785e2751a0713a63c350c3d0cf7b471059c4b26fa16aba923fd229c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.1/scopey-linux-arm64.tar.gz"
      sha256 "fa1d25afc7b01a45c839cfa631eee9c9d5b46f4d01740c83c892e929216f28f3"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.1/scopey-linux-x64.tar.gz"
      sha256 "694e011533cf8ed41f91a90c2f1c200a3190f313661fde361bfa6234e467a2c6"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

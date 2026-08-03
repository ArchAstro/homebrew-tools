class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.1.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.3/scopey-darwin-arm64.tar.gz"
      sha256 "85c5a09e0b16c70e79378090ebeb1f9778c8182a8c8d8e74859646c792c1a17d"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.3/scopey-darwin-x64.tar.gz"
      sha256 "3bb301020c98015951c3bf4e64e9fbd6395ed665be49fcf06fb9c088bf03c40c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.3/scopey-linux-arm64.tar.gz"
      sha256 "3bbd644093b477ac1a1af6f462428c43fb60daaa2fe430736f32f00f4e0a5883"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.3/scopey-linux-x64.tar.gz"
      sha256 "bebb6f77aa4bcc7e4138ca53b3451b3332dcc679a3a073bdcd2612b1e5e926c2"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

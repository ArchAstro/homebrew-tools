class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.0/scopey-darwin-arm64.tar.gz"
      sha256 "6d9071c8c7f2267330f3a7ca8be82fcf6af53ba4e793698aa5479a532e57c1e4"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.0/scopey-darwin-x64.tar.gz"
      sha256 "b1a4b880fda318fd920438d3edfa622aa5696ea015b3f44c5a6a831a2918cb1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.0/scopey-linux-arm64.tar.gz"
      sha256 "d189b770e0f34a032bb50744e5641600481d5b2b8f7ed52e1a6193950baec5b5"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.0/scopey-linux-x64.tar.gz"
      sha256 "60ea610d4f3bb5bf97ea80f441ad8e577e7ec9205bd92ccd69a8ed3b0ae2a1e9"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

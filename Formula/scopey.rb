class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.2.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.3/scopey-darwin-arm64.tar.gz"
      sha256 "87307c404619468055bf01ca5df9f7309983eea99d8fdd7080868eb49de1f1d1"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.3/scopey-darwin-x64.tar.gz"
      sha256 "aa7060c20c1b93363b6dfbd53b0ab6b7e4d503e18f3e1ea20ccbe5cac425080c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.3/scopey-linux-arm64.tar.gz"
      sha256 "e5305f60439b0f792bedd3428589c68df8fd7042a6812c8315820414e38f16c0"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.3/scopey-linux-x64.tar.gz"
      sha256 "cc4d90b94c1fd461bc4144a548694ece7c8150284840584bcb8c6aea6cbff154"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

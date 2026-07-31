class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.0/scopey-darwin-arm64.tar.gz"
      sha256 "4cb437366537146ca0f83b2ae67643315c08ea949ae961b36b9dac2e9b471c20"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.0/scopey-darwin-x64.tar.gz"
      sha256 "acafce2a8a2fdb46fd8e9e959b924fbe3ec75a230ef8a9402da0b9ebf9d8df9e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.0/scopey-linux-arm64.tar.gz"
      sha256 "d615ffb37bdbf3523f212e9bca98d33ab867f10f54e4abc821467f88165c4fb5"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.0/scopey-linux-x64.tar.gz"
      sha256 "d1e39ee5ba95f34a6f93f2dae4f846ef8819b90749d356f33dbcd855b370d224"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

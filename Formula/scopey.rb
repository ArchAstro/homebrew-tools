class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.2.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.4/scopey-darwin-arm64.tar.gz"
      sha256 "0b5b6d60ea1fb315b652bc6a8659be1a18db1ee8e5728dea68d10a4c6bcc41c5"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.4/scopey-darwin-x64.tar.gz"
      sha256 "dae86064baadcc31ddb143527dadd4a19653f10e55a9b54bf9b6ab9cd67691cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.4/scopey-linux-arm64.tar.gz"
      sha256 "29d8e11222149fa6abeebd5c8eb0a20b6cb3ee3ad79b4924ee6490eeabf07e9e"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.2.4/scopey-linux-x64.tar.gz"
      sha256 "e499d37d3112e5b3f9ff988b2984a924d8ad0d4874eb86b23fa3c1e7908cdc07"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

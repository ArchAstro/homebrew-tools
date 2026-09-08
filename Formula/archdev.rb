class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.34.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.34.0/archdev-darwin-arm64.tar.gz"
      sha256 "887be4f936940496d9dd70ec7cc2448433a78e7cbdd33100f83d09d8b92557d5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.34.0/archdev-darwin-x64.tar.gz"
      sha256 "7246fbd6a577baf7825172d59dcaaca2dce6b46e147837606768be85b6447996"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.34.0/archdev-linux-arm64.tar.gz"
      sha256 "45df87f37a6380ab6180d7826540c762334ba2360e9dc520b16a36e4757d4c9e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.34.0/archdev-linux-x64.tar.gz"
      sha256 "e800539da537f97213af0845c0f47abcfdc7cf3e5a3c8697f587a8e2be37c17d"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.2/archdev-darwin-arm64.tar.gz"
      sha256 "b4d9aa2430ff629a8f1252ef40ca70443eab7efb5afa0b42534d592bef90cb73"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.2/archdev-darwin-x64.tar.gz"
      sha256 "4e6c66d059a75c95dbfeed8998b19a5b3fe9cc9bbeaebf5579fd27539517ce3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.2/archdev-linux-arm64.tar.gz"
      sha256 "08a3d311b6f7068ffa9a4920d58811f9487ae7025c67ffb4b19562a1ba345fb5"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.2/archdev-linux-x64.tar.gz"
      sha256 "15d5f9138e39223d9a100cd6d52823462525d1e6745ab65fc4ec2f16543760b1"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

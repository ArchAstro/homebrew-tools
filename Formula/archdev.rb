class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.35.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.1/archdev-darwin-arm64.tar.gz"
      sha256 "34d7c1ccd8487a44950a292908890a74efc73bf147d26770f03097efc4ad5105"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.1/archdev-darwin-x64.tar.gz"
      sha256 "6fd1be60f79a6b4e2ece4ddb33a03bb2fed5826ddbb3f81bd15be254dfd1f1f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.1/archdev-linux-arm64.tar.gz"
      sha256 "cd15a535a46c4ad45ec172a3cba972b5151907765bc2891b5af378f0a970f358"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.1/archdev-linux-x64.tar.gz"
      sha256 "8c622fc1a505bebdbad28ae2d1f1902056c4d233444a9f47ec597625b67eddf3"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

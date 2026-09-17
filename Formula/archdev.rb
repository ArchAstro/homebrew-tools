class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.9"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.9/archdev-darwin-arm64.tar.gz"
      sha256 "fe09796f410bf2a0631573006109f6716967120e50be7f6b4e5c8d4e3369f81d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.9/archdev-darwin-x64.tar.gz"
      sha256 "bb8f6c819a9135b8e83f2c643ad15151a00bf83c6c95949cd2f58bb620efc8b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.9/archdev-linux-arm64.tar.gz"
      sha256 "6263a4c5548c23bc793712673c0c8023018d5a805aecd091778517bea3a7eb46"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.9/archdev-linux-x64.tar.gz"
      sha256 "0fa78b296a6a981c21c9cb356aa57c6caf6e514c50563ad53df3a8f9a147dfa6"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.13"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.13/archdev-darwin-arm64.tar.gz"
      sha256 "4c5222cf51fc9d5af127f728104ce2929c467e50b029909b8a1c363e18cf8516"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.13/archdev-darwin-x64.tar.gz"
      sha256 "3ea482c442ebeb07dcd015e8b0f9cdd95482d001ee1e9f0eed4ff1a27e8435f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.13/archdev-linux-arm64.tar.gz"
      sha256 "c9008e5efb73af96919ba2261eb56fb826cef0f7f2677c02c20e99091ebd0d05"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.13/archdev-linux-x64.tar.gz"
      sha256 "69ecbe4cd1b543e3a5ace3fff2e7d743944d6bfff965940431b275cccac66843"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

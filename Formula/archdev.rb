class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.0/archdev-darwin-arm64.tar.gz"
      sha256 "ce1b3f08c23a886044222e395527641fc849fd2efc86980ddb0d24bc26c7d7c1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.0/archdev-darwin-x64.tar.gz"
      sha256 "a4ebbd379f59f3c7869cff9d868f7e72df1fed12ba21785a3e066f64d44d145d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.0/archdev-linux-arm64.tar.gz"
      sha256 "5f812ce9cc774e651f419f0b75b54afe8da0420159157b4cc2dc248097fefb75"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.0/archdev-linux-x64.tar.gz"
      sha256 "5fc85199d5bf4cda439cf627cb1b6099279e418dd77e354256daba867dff2fea"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.41.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.0/archdev-darwin-arm64.tar.gz"
      sha256 "bd798a51f4eaebac7fa9e2e06dbc2c733f550d49cf0e56ebb1471605eee379e4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.0/archdev-darwin-x64.tar.gz"
      sha256 "ce6c284d6e86e2913a9eaad40a2acfd770a7436f83d656881c945cad9530898d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.0/archdev-linux-arm64.tar.gz"
      sha256 "32b99e4e5a9830c39e0d6dba710ea1db8d9e2c8f8572504f6387ff71115b5ea7"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.0/archdev-linux-x64.tar.gz"
      sha256 "f0dbb1c1ede4c110f44a948716f84355ce5a74600d30daa37d0e9d74f6ca5af3"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

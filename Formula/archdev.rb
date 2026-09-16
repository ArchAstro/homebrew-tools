class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.2/archdev-darwin-arm64.tar.gz"
      sha256 "c3079e20f51ef9762ec12fb988fdb2091397237ec8f29c2e2d127a8445171365"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.2/archdev-darwin-x64.tar.gz"
      sha256 "63d9fe4bf198860b9979d782dab9ff766779b1f79d81fa9bc6467b04ca8a2158"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.2/archdev-linux-arm64.tar.gz"
      sha256 "ffc28830e06be3ea2ea1a210dfa7e7b61205ace92a6d317d9751fd2aef99f8e6"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.2/archdev-linux-x64.tar.gz"
      sha256 "511840243f815f3b7efb6cca209142158cb949d1569c767fd1afab8b0ac5cd65"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

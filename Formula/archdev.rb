class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.41.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.1/archdev-darwin-arm64.tar.gz"
      sha256 "7f1974b10bbeb1f93c8c816180290583d3246fe9f788f59303ddea494567a2ec"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.1/archdev-darwin-x64.tar.gz"
      sha256 "9ac5ca32d6745d73156d013abd0ab4b9ee59888fa9139a6c3e1db9dc38c390ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.1/archdev-linux-arm64.tar.gz"
      sha256 "28412ba9267d144bbdc4286888e16a8bd32acbf92b5e4c9e34d4675fa507c9ac"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.41.1/archdev-linux-x64.tar.gz"
      sha256 "d93856276e6a3a944e6df72b55442caca390c4ae8f832b73a330ddb7a4519a2c"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

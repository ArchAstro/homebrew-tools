class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.38.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.1/archdev-darwin-arm64.tar.gz"
      sha256 "15b90986567011e40d56dfa3547f5d1be5e4e51f81da32fe6574313ac4a12226"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.1/archdev-darwin-x64.tar.gz"
      sha256 "0ae1fdcb5c777f65e6b22c073a50df93b831a0d8020c4e8a2d3b7898d759858d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.1/archdev-linux-arm64.tar.gz"
      sha256 "c3dba6b5b23233f71bdb1131eff2d4d09192dacbb79dc940603454f541ef8964"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.1/archdev-linux-x64.tar.gz"
      sha256 "d62ea742c30ad374f06166ecee0865e20ea13a47f641a2cebb1b4cb825132f88"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

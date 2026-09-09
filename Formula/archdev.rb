class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.35.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.4/archdev-darwin-arm64.tar.gz"
      sha256 "275b72a532279718fb87f2a171ed88fd493d01e7001dc696c698a52dfc404b21"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.4/archdev-darwin-x64.tar.gz"
      sha256 "7762459429ec1c31f47aca884fea237b95952effda4020574a5617b34d98a4ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.4/archdev-linux-arm64.tar.gz"
      sha256 "932ecf2da2c0f73edb283da3c833055c6ae39829e5f4596a696a2d8ed1210500"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.4/archdev-linux-x64.tar.gz"
      sha256 "3f2f548d1e203601b41b46257f8ec367bac67a7b3a35e233a4faa83e25060c88"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

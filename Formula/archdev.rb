class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.38.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.2/archdev-darwin-arm64.tar.gz"
      sha256 "55d666754e033ea46aca36c2c23433c07c20c9d16649264b822476f0aade5853"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.2/archdev-darwin-x64.tar.gz"
      sha256 "f4ea330df489159616eac30773fe3240334b8b34cc425fd7b58a16a7920136b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.2/archdev-linux-arm64.tar.gz"
      sha256 "f5d8f9e5cd92fb6211110282733952843a86fb6061ac132bdc2f136cac396d80"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.2/archdev-linux-x64.tar.gz"
      sha256 "c21e0d74b7d1835c878d2416b568d0bc51ed50955ac9c34ad8b219e1d84aec3e"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

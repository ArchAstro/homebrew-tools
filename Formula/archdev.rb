class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.44.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.44.0/archdev-darwin-arm64.tar.gz"
      sha256 "99b8c20b8b13ac148ffe4623a4036c7b0c57267c1673a058129add6befecdbf8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.44.0/archdev-darwin-x64.tar.gz"
      sha256 "c51d0169d0f35c1b6a803423a15574ef911a25f4a0baf9b3a4814f2135bf6c69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.44.0/archdev-linux-arm64.tar.gz"
      sha256 "19629cf24f5d88fb73a95f21e45f98c438f66b104acf1994e4a2970eab771d13"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.44.0/archdev-linux-x64.tar.gz"
      sha256 "07a6f4f93a81ecb386230a2dc55c4a3f843e13c5b5eb0ea496fefda35f9d5f1c"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

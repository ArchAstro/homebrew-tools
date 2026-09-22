class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.3"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.3/archdev-darwin-arm64.tar.gz"
      sha256 "acd8a56f7dbff05f17265580673677fac941a425a39480fdaaa39b7a3a2beb5a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.3/archdev-darwin-x64.tar.gz"
      sha256 "2e77273fbf51952bcca97bb8649540cc53dced21d86d42165196447084cbec0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.3/archdev-linux-arm64.tar.gz"
      sha256 "0820fb77c264171ac529d4114d9115e1ae8caff9c5c9bd54837c63bd44263c00"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.3/archdev-linux-x64.tar.gz"
      sha256 "2e2a012db0839d538228ddf727f60ac4dc847fc1bbc8a4f62a1c79a9c6f0977a"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

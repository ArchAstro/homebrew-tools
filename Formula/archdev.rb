class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.32.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.0/archdev-darwin-arm64.tar.gz"
      sha256 "55e73407083b766b31c4be43d60b1a690069614ba4daf40e55e0419e13f4c5f8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.0/archdev-darwin-x64.tar.gz"
      sha256 "bff3bf7ede9fb77b35ffd6d89ded7f3986b84de0bff47adfdad3f3f35e569932"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.0/archdev-linux-arm64.tar.gz"
      sha256 "c5d81aca89031c1a13e669c8d7f2238514aea3d7bf550218f7875efafe6bd176"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.32.0/archdev-linux-x64.tar.gz"
      sha256 "f1ed3e94af7348c5fe45b0d29b3fbc1a448a08f2ba6f301dd4523217c9ce402e"
    end
  end

  def install
    bin.install "archdev"
    bin.install "archdev-dashboard"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
    assert_predicate bin/"archdev-dashboard", :executable?
  end
end

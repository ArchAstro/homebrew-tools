class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.31.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.2/archdev-darwin-arm64.tar.gz"
      sha256 "23b2cb9492b4d8290d27767b08fa2bb63f56a358c68ce342c9465047661799b1"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.2/archdev-darwin-x64.tar.gz"
      sha256 "1e647bfb41b31d08564633e2d463a1e2defe779c3809310cb8506339fe5ed8fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.2/archdev-linux-arm64.tar.gz"
      sha256 "5947c0ad7e390769f9f3e8b5422a90666fb568d8613f1ed8cae52a316e2ca734"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.2/archdev-linux-x64.tar.gz"
      sha256 "86f4b17869e158cef9392abf7fb7b88bd551182c5a24c2ab900c2e3b756b7222"
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

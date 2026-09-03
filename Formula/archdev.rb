class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.31.1"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.1/archdev-darwin-arm64.tar.gz"
      sha256 "7a0a3f64d24bc0737b1645a94edbef1a173e68c3360e0f4656552512f12e8203"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.1/archdev-darwin-x64.tar.gz"
      sha256 "fdb170dc82f47e622d2b27ffb599025976d493a77655a0afb8afda0872d8d390"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.1/archdev-linux-arm64.tar.gz"
      sha256 "26c0e8e889771da3986fd38f286a19c45d540dfa79289833958eea71d113a47e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.31.1/archdev-linux-x64.tar.gz"
      sha256 "bffa82ecd878f94e8855355d61192d286fd474ddb10f603479cb98608a845b67"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.12"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.12/archdev-darwin-arm64.tar.gz"
      sha256 "6677fccccfa90192ccc6e27c33029a2b88401ca615559ca054feb3d147737a9e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.12/archdev-darwin-x64.tar.gz"
      sha256 "4dc2ee368fc57253244ad8e8ef776449d87fc64d6c2ab520c733aa51734df525"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.12/archdev-linux-arm64.tar.gz"
      sha256 "627a774d62da33ce14fa9072a98d58541d1d32da0723e7f8d85ba40aa026275e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.12/archdev-linux-x64.tar.gz"
      sha256 "986b391bd64e7f3032d843874373031297474766fda248f99696a9b55a58f6cf"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

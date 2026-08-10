class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.10.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.2/aster-darwin-arm64.tar.gz"
      sha256 "dbdf5107053ff79072ac216618bb488fdc4925b316c9ba95947ab94ff80c1d01"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.2/aster-darwin-x64.tar.gz"
      sha256 "ba92bbce81232d051b7a5026de617edea0320841970a5cca1a5caf8b8599f47e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.10.2/aster-linux-x64.tar.gz"
      sha256 "00633c95aacbbd76bbec8a9681930101fc116a9dad026f9ed120627877e84b84"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

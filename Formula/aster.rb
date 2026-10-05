class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.15.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.15.0/aster-darwin-arm64.tar.gz"
      sha256 "4bffedecfb9e5c6cc81e87232c20a054ec0cf86916fa295dc3aade6a85c5eb24"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.15.0/aster-darwin-x64.tar.gz"
      sha256 "fb5e37d39ee4a5b8b8e7988dcd98737a3a96151c38aba465b1a1f5faba23378e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.15.0/aster-linux-x64.tar.gz"
      sha256 "ed0e2c1b9b257aa91b07c0aca3c193fe62c3465758acea2854e8134b428d4d21"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

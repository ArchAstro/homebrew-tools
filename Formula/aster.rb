class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.23.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.23.0/aster-darwin-arm64.tar.gz"
      sha256 "05664295e1efd07eac7e18ca26736ef326d05c6693eec89ff9d84e97f72bb92d"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.23.0/aster-darwin-x64.tar.gz"
      sha256 "b74c05d071b69250b84ceaa7641a485f41f9597ab4292008fc5d341e2f3aee95"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.23.0/aster-linux-x64.tar.gz"
      sha256 "4163c2a3f16513d3152df38027aeaa97644cb18679da1c60489ff2fe2fc344c4"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

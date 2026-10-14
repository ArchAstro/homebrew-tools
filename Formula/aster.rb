class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.18.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.18.0/aster-darwin-arm64.tar.gz"
      sha256 "df7f0211074890d11d0063aeb626586d7195c0216ffdcd09cb956bc849b28fc0"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.18.0/aster-darwin-x64.tar.gz"
      sha256 "0cb573381ebe68448547324dd56bfd21a2e5802bdeaf2e52876298eea41b4c56"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.18.0/aster-linux-x64.tar.gz"
      sha256 "0c328083e5c8deaea964e3bbde4f3a6dd15ab117f8d43b42e23a523155670ef2"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

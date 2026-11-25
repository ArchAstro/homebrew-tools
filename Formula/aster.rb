class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.37.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.2/aster-darwin-arm64.tar.gz"
      sha256 "b75c8d2d492206032e1feed64c57ed4ad1788626fb62a72daed93e03aef72e5e"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.2/aster-darwin-x64.tar.gz"
      sha256 "f65cea47e6bbc22903c6d6b7857d4cea214f3f6078a34e6d9bce3fbe86b4068b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.37.2/aster-linux-x64.tar.gz"
      sha256 "669c18947787991fe0948f9a8e38b01195b2a51cc7eb9a12c46590cbf67b8072"
    end
  end

  def install
    bin.install "aster"
    prefix.install "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

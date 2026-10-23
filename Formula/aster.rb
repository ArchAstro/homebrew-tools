class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.24.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.0/aster-darwin-arm64.tar.gz"
      sha256 "fe0d9abfde760321009547451b5867f63b025216b824de58fed6b4ed4c3dc5a5"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.0/aster-darwin-x64.tar.gz"
      sha256 "5ef6a46606b96e5adb369a12865f1df847d5b00704a55024648eb4129dfb8962"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.24.0/aster-linux-x64.tar.gz"
      sha256 "8e3eef381ba06409d957eeb0472f08513a59fa4752afae056a2fe8bc7a677c23"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

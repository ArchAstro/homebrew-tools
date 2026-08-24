class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.13.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.13.0/aster-darwin-arm64.tar.gz"
      sha256 "98f35ff7ae3c0f07679b40f6e4225430210b1dad5741b078dfd7f841572e2180"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.13.0/aster-darwin-x64.tar.gz"
      sha256 "543b0cc563c138375e599d08a5bea4fe236fcf330b9901f4ce1ae87eeaffbdfc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.13.0/aster-linux-x64.tar.gz"
      sha256 "69debeef51075730206e531c5289e18eb148c91f1a638b1197ffc35670eb5969"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

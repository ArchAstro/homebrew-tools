class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.31.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.2/aster-darwin-arm64.tar.gz"
      sha256 "ad0a08df3f67ff7d7d10ac9d09374fa4ad39714a310acd2e51e3665107aaf2ff"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.2/aster-darwin-x64.tar.gz"
      sha256 "29d68debecde659a60c7fcfd9281a07c77b0c14f8c32ebd6ad64108906054b79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.2/aster-linux-x64.tar.gz"
      sha256 "c5c3505dab26ad6e51c4871b865cea8f87235e85f7ab8fe5d4161774d4871d74"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

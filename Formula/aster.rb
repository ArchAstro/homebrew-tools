class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.12.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.12.0/aster-darwin-arm64.tar.gz"
      sha256 "bfbb39bedf352f9be40483ff5f240b7592bacf29abcd9510c7fa9cfc799a2163"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.12.0/aster-darwin-x64.tar.gz"
      sha256 "7193e90760c7a920b9c5458d29fe689d534d73621a48f66a2f4b17382127e51f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.12.0/aster-linux-x64.tar.gz"
      sha256 "d57ffb3b419b0566b81ad331937469c15cf69fecae5ad8978a757e1579a4c340"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

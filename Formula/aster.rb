class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.30.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.4/aster-darwin-arm64.tar.gz"
      sha256 "b57eb9c16844ba8de9936e34773512fd469052fd66744b310ed1f3e60885b7d9"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.4/aster-darwin-x64.tar.gz"
      sha256 "69e705298dbd4ee5d3eaeb6880b1f90dfeee849714c2fdb9ed88673e7ee425c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.30.4/aster-linux-x64.tar.gz"
      sha256 "e35f7eb2f68d959222842f65354eea43923bc631702045f4476a8b6ca654c3a7"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

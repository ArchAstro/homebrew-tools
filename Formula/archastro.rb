class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.28.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archastro-darwin-arm64.tar.gz"
      sha256 "cb683cdfb1816f1fa172cdd2b986eab1c89d20d7fceaaadc3e112a8b9c80d049"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archastro-darwin-x64.tar.gz"
      sha256 "c9e2d438ded9c72d3edce2deedc83cca32e2d2c53442f9d502dd0dc8984db77c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archastro-linux-arm64.tar.gz"
      sha256 "2163591dfcdb4df19b489a14d606b2895bd74b4087fbd71d3c7356aa6c040446"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archastro-linux-x64.tar.gz"
      sha256 "b3ec6481da05ad4ac232e4847184037b98c48fd959914574012be23913ba905e"
    end
  end

  def install
    bin.install "archastro"
    generate_completions_from_executable(bin/"archastro", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archastro --version")
  end
end

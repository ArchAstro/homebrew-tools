class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.10.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archastro-darwin-arm64.tar.gz"
      sha256 "0882830cfc2c78d96482db3a62dd60dd3a1958889559b7ead099c74d543fe6ac"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archastro-darwin-x64.tar.gz"
      sha256 "d0fa5858d02e6693d77ada491fbfcda2b22acd45637cd0c8ee7cfdab4cf4370c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archastro-linux-arm64.tar.gz"
      sha256 "657b59e598ff08a5ad1c4a1e1edfb919a61458f794021370b66f3185d84062d1"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archastro-linux-x64.tar.gz"
      sha256 "7982e876ffc99f83d9cbdf7721e204c760b4eeaad8a0f65fbb97e92a75ee4004"
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

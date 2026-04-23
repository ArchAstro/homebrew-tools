class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.27.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archastro-darwin-arm64.tar.gz"
      sha256 "2d9962ceae02be99454ff2592bb03b901b20583fbc237bf6aa3e776bfcb9764d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archastro-darwin-x64.tar.gz"
      sha256 "720e751698eb54181abb6ec403f136a17f7dc4ece851843672dd68ea44621290"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archastro-linux-arm64.tar.gz"
      sha256 "229bbdefe50cf260e0522cf55ebf10a5beb4721e55d76104dc30400fc0128fbb"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archastro-linux-x64.tar.gz"
      sha256 "9a940ef2e1a846b5e7d84abf38b6b4d470d0f434d86d02ff92fd39711866bfb8"
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

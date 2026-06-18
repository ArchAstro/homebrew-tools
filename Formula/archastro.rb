class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.41.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archastro-darwin-arm64.tar.gz"
      sha256 "2b0fc282848deeea52fbaf3ed2f7ef3b9d122838ae14857520b6dc01e2d30408"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archastro-darwin-x64.tar.gz"
      sha256 "91482147db2233045e9e16282f57fc1277c9bef8c12391af2968a4d7c53f6d17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archastro-linux-arm64.tar.gz"
      sha256 "1cb03946d02e8cd3ae2ee066d39d73eb31ed6e94379c692f3f3001dffccad8ac"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.41.0/archastro-linux-x64.tar.gz"
      sha256 "dea14e3ea542c0d463024af7fb7441785cbc8b832857f240b136720dd09a58df"
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

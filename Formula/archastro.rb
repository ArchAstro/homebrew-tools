class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archastro-darwin-arm64.tar.gz"
      sha256 "9206a48be3e226f8e4503eb80589796a46aa2a880deb69a42b00eed07a5f6923"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archastro-darwin-x64.tar.gz"
      sha256 "0aacb2db7b6ae9b30847f863f9cd8e7754fe81334181d80537b77251418dcb78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archastro-linux-arm64.tar.gz"
      sha256 "8c9daf398e6708e474334835bdb5523d43e640737b367e133e17fb66769fdf1e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archastro-linux-x64.tar.gz"
      sha256 "f14ea444d25482d8f3a1251af42df0f8ba74072a4d5e5a33d2398cfd3417020d"
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

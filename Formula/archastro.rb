class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.40.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archastro-darwin-arm64.tar.gz"
      sha256 "b48883e2dd0e80a94f760e40fad4496d207e415643d22c3b38f003547b70461a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archastro-darwin-x64.tar.gz"
      sha256 "2ff305a1bc5b2ee446f2e8376f719f8d328aa9079a8deebc1110051632097882"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archastro-linux-arm64.tar.gz"
      sha256 "66708cafe436e2296c8621aec77ffab453bf3828de12fa26d9a80d2569700d14"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archastro-linux-x64.tar.gz"
      sha256 "192a5910dae4ba0ce2440e01ef195a6bf6805a26be6403efeb2217fb11bb5690"
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

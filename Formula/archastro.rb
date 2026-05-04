class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.30.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archastro-darwin-arm64.tar.gz"
      sha256 "4cbca8ea84a5d6ee370717aba39bc49b2c39d74e98363ee9965f1069b653d5ad"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archastro-darwin-x64.tar.gz"
      sha256 "2f24f142b2f9e63391c33cad81ee0d1a66b06f277795493d9f7d9f21bd417f02"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archastro-linux-arm64.tar.gz"
      sha256 "8b82b401df74b80e106b985e1211f68b9c668a768d3dcf5e7ee5f9d09311e863"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archastro-linux-x64.tar.gz"
      sha256 "43038cb8072b96890494d8822efce699c460c33934561a02ea4970288896ac4f"
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

class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.59.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archastro-darwin-arm64.tar.gz"
      sha256 "a5a624acd3694136bbdb2959c628dbbfd57493226192d48243c4b4fbc1bcedc2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archastro-darwin-x64.tar.gz"
      sha256 "6a24aa2c6cb107d80d5cd320799a12e23a9b1cbbde43ce937801578489812ba6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archastro-linux-arm64.tar.gz"
      sha256 "2873023a85ca67689f54ad09d9f5d9a0f33ef77f385bb78c65941774efa5484a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archastro-linux-x64.tar.gz"
      sha256 "cae1f708130cbd6bdaefd0cf9082f7d410105718b0302fa2653f4f24c113904a"
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

class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.55.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archastro-darwin-arm64.tar.gz"
      sha256 "07e79ade6f2adda57be44aa16ae3eb860f744617a74140e961a7fbda452ee666"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archastro-darwin-x64.tar.gz"
      sha256 "4a9a3705f0da260e8615a29e05eaf7d3a4efe50ec0b3f84d9087eaf0bd5816e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archastro-linux-arm64.tar.gz"
      sha256 "ea9904c032ab7ee9984e1f53b39a8d5a172e03481487a68352bd6d36b1adaa72"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archastro-linux-x64.tar.gz"
      sha256 "a8c0cf790d4063a850c5e20e870cef1dc0b6cbf91f0e695901e2bb893a0b64b8"
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

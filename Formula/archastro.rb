class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.23.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archastro-darwin-arm64.tar.gz"
      sha256 "197b78775bca95bec2929f197688ad2e6602bd4b5339e86b27119dcac585a4a5"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archastro-darwin-x64.tar.gz"
      sha256 "9ab4723349b50c6ed849d031d094e4f949c2f421940961a424e6f678e2cc5ced"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archastro-linux-arm64.tar.gz"
      sha256 "a205a6c3205cc474fdee736026753210a4f53792fc4f4534321f742285ad2839"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archastro-linux-x64.tar.gz"
      sha256 "51eecbc2cc22d6cea9d89b8aa17bcc28947fe8a4ed400cf6c2a7595f237ea8de"
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

class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.35.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archastro-darwin-arm64.tar.gz"
      sha256 "f3e2099737693647a8a7c74f21eb33e3bee67e62d4573a156346ac47668654c6"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archastro-darwin-x64.tar.gz"
      sha256 "7561fffab494292d93177dbd6e14a1239d668001a2d948b04644fe3677ff44f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archastro-linux-arm64.tar.gz"
      sha256 "64e6ed2004f7630c7723fa512944ef2f336416eb72307f63b5ef71162336d09a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archastro-linux-x64.tar.gz"
      sha256 "205ee281e43d4fe7620eba229d2ca6ba7299c81720ec8b0596fbf1d2e63437de"
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

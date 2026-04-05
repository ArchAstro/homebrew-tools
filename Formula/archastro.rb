class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.15.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archastro-darwin-arm64.tar.gz"
      sha256 "3af609edc2fcaac884bf45559a73988188c14931066d008f516d779f26804117"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archastro-darwin-x64.tar.gz"
      sha256 "251afaaf4b1bc9f56c450c542cda5ee9bde844e6149baf28a29aaf2f6ab51ecd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archastro-linux-arm64.tar.gz"
      sha256 "a3fc2998f33d3a9170713bd8dc4d37b06c501994066472f8d64bb5f85b63a609"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archastro-linux-x64.tar.gz"
      sha256 "da3907427293853ef2efd0b49c9c2d0566a3d4a32aba918452f6a3089a8a3195"
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

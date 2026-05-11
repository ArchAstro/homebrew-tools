class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.32.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archastro-darwin-arm64.tar.gz"
      sha256 "17f536ec00bfe0162ac50d04f7e6f6fbd409446dfc85b5628963207f1c0e1096"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archastro-darwin-x64.tar.gz"
      sha256 "2e74b01cb30f065759208acb0a1fb8870e9ca00dbf2599cd6fb419b6d8b8e50e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archastro-linux-arm64.tar.gz"
      sha256 "e48eb6744f8912723351a49d4c3e8bfa93391a62810d5b1ea492554b42700489"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archastro-linux-x64.tar.gz"
      sha256 "423be1cb80b0646156999bce543bb815e189eb51e6f73932d937cee223fd21dc"
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

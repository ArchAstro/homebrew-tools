class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.18.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archastro-darwin-arm64.tar.gz"
      sha256 "0a09c6c705a7626124028a584930a2a35a847c271441914474ed5f261d59277d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archastro-darwin-x64.tar.gz"
      sha256 "eec89f2f72fffeda14f982af4accac7f4f2b9c71f58fb24716a5a234967a26cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archastro-linux-arm64.tar.gz"
      sha256 "ac9debecbc19381071617449fd5a9c386be52bc8f1a70e4244a002ead82e29fa"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archastro-linux-x64.tar.gz"
      sha256 "d112b2cb16ac1705f87077bb6e3f5627125c1e0f438e406197dfbc030771c5ec"
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

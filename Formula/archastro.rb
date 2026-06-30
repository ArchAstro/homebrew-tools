class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.45.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archastro-darwin-arm64.tar.gz"
      sha256 "20732272a2195066d0ee78a59281ddd7f3cbe26f117b38d2b4e351c336f6d228"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archastro-darwin-x64.tar.gz"
      sha256 "8921727dbd4cef49788a9900dca86f61211e468082dbfefbdb39532115f9b9f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archastro-linux-arm64.tar.gz"
      sha256 "b312c8747181b8c98cf60dee5969b771aa4d817c127101e417f0581de238ea98"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archastro-linux-x64.tar.gz"
      sha256 "1ec12063eb210629b6e9f5668c8a15f844f302aca1c67a22aeb699edfea2fab1"
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

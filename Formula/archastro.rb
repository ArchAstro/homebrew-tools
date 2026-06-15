class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.39.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archastro-darwin-arm64.tar.gz"
      sha256 "28772663d551170866be188b75b23ee1270b860e74359a14070f6fb8011c4ca7"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archastro-darwin-x64.tar.gz"
      sha256 "b96c96c8c368bc88b7c0bef2032401bf98de837a94bc13ad477b49701585b93b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archastro-linux-arm64.tar.gz"
      sha256 "f33948c32961f11fa6a53e0337ef1d99dfc472e1632b9311e8900724d7c071b7"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archastro-linux-x64.tar.gz"
      sha256 "98fb74873cd49ac096ee240542fd88169dbd963fd71d42b2832c4f82f0027308"
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

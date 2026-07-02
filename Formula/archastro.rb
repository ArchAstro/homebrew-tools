class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.48.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archastro-darwin-arm64.tar.gz"
      sha256 "bc109f29f5c73a17755519543f0795b0cac39ab94c9cc70ae4900688c5e45bf9"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archastro-darwin-x64.tar.gz"
      sha256 "2fce4fae6312757699e600a69d7ea136049ebc4b7171c2de3221bb4274b2423d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archastro-linux-arm64.tar.gz"
      sha256 "1711240d93d1a8bc3d465a82ddb54ed368a540e2891527f0c9066d855872468b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.0/archastro-linux-x64.tar.gz"
      sha256 "aa33363e26f243024b60f7f85d6e9749d31038ca0602e0656b16123817cbe753"
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

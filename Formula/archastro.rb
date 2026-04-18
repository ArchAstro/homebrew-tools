class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.24.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archastro-darwin-arm64.tar.gz"
      sha256 "ba53f1c90bd4428ccb6393b022fe391a9af02455f623fa212532c283cf862644"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archastro-darwin-x64.tar.gz"
      sha256 "6aa0489f05c3d5ad125e276d6a0988a21fd9bf4795798c05ec18283f4e766e28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archastro-linux-arm64.tar.gz"
      sha256 "e43d581d69f416f7dbb1173fdb6823e8db5db90fc6955519241f4570c9dc2d85"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archastro-linux-x64.tar.gz"
      sha256 "e66e97f78ebfb700ccc25fbec21715fb23995367741384b7c6843d453f8f7c1f"
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

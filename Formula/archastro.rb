class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.50.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archastro-darwin-arm64.tar.gz"
      sha256 "6936d982f4a9cad3ed9469598d9b47d626a104de443be77a082c7c27843491ce"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archastro-darwin-x64.tar.gz"
      sha256 "593541c06037441286395c01094296d6bfa12a61e97635cd6299a5c9e4ff754d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archastro-linux-arm64.tar.gz"
      sha256 "495fe0228c771da445cfac569fe7a2afa0a5a3f6ea4cc4384741b86285363450"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archastro-linux-x64.tar.gz"
      sha256 "f50c244ab779f6127b476584496558610ade8dc5bedbb64d75115ac29d52eafb"
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

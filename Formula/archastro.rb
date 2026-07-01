class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.47.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archastro-darwin-arm64.tar.gz"
      sha256 "87f1e7d0506191d6aeb3714fb5cae9628b775880ee0d50b0366196a39672718b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archastro-darwin-x64.tar.gz"
      sha256 "fc1c4613fdd59bb53c80a6b87900da50088eb7198887c29dbee2a04ea36ea582"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archastro-linux-arm64.tar.gz"
      sha256 "319a071fdef1e750925ba0dda7703d2e08b4d61ffe68b4923c31a7ecda81093c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.2/archastro-linux-x64.tar.gz"
      sha256 "72cc6d61f41765688ac1062dc01e632f403785be45c57e6a02568382b2c582d9"
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

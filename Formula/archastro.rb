class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.4.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.4.0/archastro-darwin-arm64.tar.gz"
      sha256 "9d4e3a66a9df0053ed20f622dd5b46c404957a125b3a97e79a4601a4a749e53e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.4.0/archastro-darwin-x64.tar.gz"
      sha256 "833bb08018645ac1a7228bde824c12c1e27e8f35e89b7b596141e0f7111c939d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.4.0/archastro-linux-arm64.tar.gz"
      sha256 "bf5e1d2cd451ca1366d51ccb4763fccd7a140ff26f5e8d82d32490c88c0aa028"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.4.0/archastro-linux-x64.tar.gz"
      sha256 "72b16daa1097190e91a91b50e945249f59c9deaee79bfe0d22fbd8c183fcca53"
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

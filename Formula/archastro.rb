class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.3.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-darwin-arm64.tar.gz"
      sha256 ("0" * 64) # Replace with the released darwin arm64 checksum.
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-darwin-x64.tar.gz"
      sha256 ("0" * 64) # Replace with the released darwin x64 checksum.
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-linux-arm64.tar.gz"
      sha256 ("0" * 64) # Replace with the released linux arm64 checksum.
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-linux-x64.tar.gz"
      sha256 ("0" * 64) # Replace with the released linux x64 checksum.
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

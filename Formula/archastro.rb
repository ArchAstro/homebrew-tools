class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.58.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archastro-darwin-arm64.tar.gz"
      sha256 "92914583fc0210a0a726808358ae5ffacac5200f383cca3257dd99da894bf5d0"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archastro-darwin-x64.tar.gz"
      sha256 "bf76176d4f53ad1de78364a957ed2fe69cca5b8042ac273b2f7c86eadac8efba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archastro-linux-arm64.tar.gz"
      sha256 "8ca2ecaf609cd3baf00aa1de81d112613beb8f9ad7d09db96395b6f85167d9e3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archastro-linux-x64.tar.gz"
      sha256 "cdc3eaa9df5d03f4aeea816eab8ee424e5010cd9fdacfabffc4f25c84cc58b8b"
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

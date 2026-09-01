class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.61.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archastro-darwin-arm64.tar.gz"
      sha256 "11fcab77e2e6bd9161bf42e2e99d1c0a46246b7d97690d4219d7f14a6992c18f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archastro-darwin-x64.tar.gz"
      sha256 "c26dea018d4a52ae87f6a9b9338d9fc2a08c8ec2ef27f61c5bad6688d3699d93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archastro-linux-arm64.tar.gz"
      sha256 "e5d351d08615e74dc5daeb435e44a698112cd300557a108117ea8cee3fde950e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archastro-linux-x64.tar.gz"
      sha256 "080f8b999ceab971c91c5d1a616db3ea8062815b185c46037061951392d1d6c2"
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

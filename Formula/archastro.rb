class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.34.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archastro-darwin-arm64.tar.gz"
      sha256 "522424c2168403769ee83c98c5220834af91b3d982eb01be076a8c0cbea11d1c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archastro-darwin-x64.tar.gz"
      sha256 "b21f5668cc3cc87f818331b8301286d58c32ddefb46aa0bfea483fb71b47ef0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archastro-linux-arm64.tar.gz"
      sha256 "851cfa1a2a026a9641d5c9c0be6dd1278be3f958d7f996798471239ba41f3f8a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archastro-linux-x64.tar.gz"
      sha256 "d4e2991c7974626b6f6a8bde5868e0a84af14e6aa7d54cbf5187d9ed28610a64"
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

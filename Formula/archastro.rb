class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.42.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archastro-darwin-arm64.tar.gz"
      sha256 "899d05f7b0b5bc7350eaf45f968e30f5611652dc61b8f2464aea826640f33026"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archastro-darwin-x64.tar.gz"
      sha256 "7ab2373edee1566a91affdcb8041aa7bb4de6c973af10dcd3c9ab61771b56135"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archastro-linux-arm64.tar.gz"
      sha256 "23890a8d1da9caf1c9e66247c216e38d4239f4e32e62ea4c7960eb9af70b9137"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archastro-linux-x64.tar.gz"
      sha256 "09e40bdec373c1418f8fa646d389887ddc528b83945845f1da41eb66ca4f1e5c"
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

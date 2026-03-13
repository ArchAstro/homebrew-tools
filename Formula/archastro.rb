class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.3.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.2/archastro-darwin-arm64.tar.gz"
      sha256 "736b10e6c90b6225a2e40429e25b754329baf778e099a8158f0120f547f3ca51"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.2/archastro-darwin-x64.tar.gz"
      sha256 "b385d08fed7e8396615500388a32eb59452fbb5bf16d1fdf3defdc721ad52338"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.2/archastro-linux-arm64.tar.gz"
      sha256 "205c523df43ea1f2341fd27c2d414250a6ca19d048c90bd4a131af1e5e13ff0b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.2/archastro-linux-x64.tar.gz"
      sha256 "1da870cfaa71f767bb4b414c7562ddbfcba378e00f59c11d9fe2d956c333423a"
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

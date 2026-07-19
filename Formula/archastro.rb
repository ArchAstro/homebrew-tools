class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.55.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archastro-darwin-arm64.tar.gz"
      sha256 "3e515a7b5078d5aafe29ba60b7e88ee7c4d011c5301728817d3fba7e598065c0"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archastro-darwin-x64.tar.gz"
      sha256 "c549bf188c8341a927b48bb0c70c7b48068f1e44177eef1d8446ca7f11c73e24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archastro-linux-arm64.tar.gz"
      sha256 "34ae8983b73ccfacac7c99b431f7c80fae2af35e478b7bc98a3070bf9d3c40bf"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archastro-linux-x64.tar.gz"
      sha256 "d3dfec4860c23b7c0282a1d2e605453fc57b243939e23c3a9b62ce8833af38e8"
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

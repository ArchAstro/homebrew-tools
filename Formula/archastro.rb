class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.33.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archastro-darwin-arm64.tar.gz"
      sha256 "740932dd5b8aae09c99af474ff0c6b3f8826c55ee4e8a5f0bec6d802c528badf"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archastro-darwin-x64.tar.gz"
      sha256 "6a410e82bc666718be39b319234db9d24968892f74c343e03b8c5a183178e7e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archastro-linux-arm64.tar.gz"
      sha256 "ca10d2306bef2d7466d945e4db28094abdd19bdec39649015d61c01406248c77"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archastro-linux-x64.tar.gz"
      sha256 "bbbdedb6555ea79f3aee501c81b0316458ffc8a4f05980d3d4ca2141fdb53d7c"
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

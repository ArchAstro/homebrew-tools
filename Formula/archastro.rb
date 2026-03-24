class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.7.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archastro-darwin-arm64.tar.gz"
      sha256 "46cd65122d46e53d0b444ffd8846c8f1e29f049db5dcd9e23d904a001b3aa258"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archastro-darwin-x64.tar.gz"
      sha256 "df0fb31fd2624e6c704adea2f66355f482205e38b1437ffc78e0c5bd3747a2e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archastro-linux-arm64.tar.gz"
      sha256 "9718a79bfe8bc10612a70af606908275e4c884aaa40e93d6807092db1ad13886"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archastro-linux-x64.tar.gz"
      sha256 "e301c4a085d8cfd197e89baf1d523fcfb84ed36938ea8f90527bd57cf3213418"
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

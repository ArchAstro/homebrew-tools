class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.8.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archastro-darwin-arm64.tar.gz"
      sha256 "406fbf42ee79624b58d02a74f66e2b5ac560cd2629a5ad076606dcd5ef4a3b07"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archastro-darwin-x64.tar.gz"
      sha256 "edef5725405f1c5df1c0eb781c71831cbcda78c8e11c74e77121aa9ecb1c0cc9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archastro-linux-arm64.tar.gz"
      sha256 "c3518c436b85f3cc9038543adc7686c1e17e0d68755f416dab99070adf0133e3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archastro-linux-x64.tar.gz"
      sha256 "91b76e38d751bf4257a5901f9ca56d13d0d1500f907e74b24819fb0dbce4f605"
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

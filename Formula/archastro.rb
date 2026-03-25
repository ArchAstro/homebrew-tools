class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.9.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archastro-darwin-arm64.tar.gz"
      sha256 "82d870311af7d86e92c7d30235c21a4890a5443359ab57e88a710b96d64788de"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archastro-darwin-x64.tar.gz"
      sha256 "4144a50b845f865a5e515f008e620d9daab91b5d4882f1424e313a3e395e16ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archastro-linux-arm64.tar.gz"
      sha256 "e60382feee2fe3af2953cc7e6bbc521275b7059228590f0b81e52bbed2542b6f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archastro-linux-x64.tar.gz"
      sha256 "1823cf8ec9b55b892dfe628a2156c737d2b0b21b84346b9f8ea2d9912ee4ac2c"
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

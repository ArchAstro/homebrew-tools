class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archastro-darwin-arm64.tar.gz"
      sha256 "a6daef7faf3c46811530c5c0e14ffc621860a6a76276004329b5f88ddbf686df"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archastro-darwin-x64.tar.gz"
      sha256 "53eb025d078cfbdb1c526ce587189b4f6bd4419b56d60a292ec29254033a7834"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archastro-linux-arm64.tar.gz"
      sha256 "1a80c92c3353f7b523baf974cc5626041b6a515099c63a1eb4fc28ebdf3a4e5b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archastro-linux-x64.tar.gz"
      sha256 "ed4103b2722a6a4a62f08bf91ec87597985434edf00fb56db49e25bee836d93c"
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

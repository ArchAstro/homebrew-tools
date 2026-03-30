class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.12.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archastro-darwin-arm64.tar.gz"
      sha256 "144209c13e9f45cd3587d1ce31322f355b041fb439d07f661602e5e5c55deec1"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archastro-darwin-x64.tar.gz"
      sha256 "35c2fa4896750f0920e84cbc9a6a2b4d1b8765c7e5bbf6feb81583b9edeadc92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archastro-linux-arm64.tar.gz"
      sha256 "ac4c8e9e7a8ed05fb3b86acb731055b1d703f3594211cfdff83fdccf5de885f8"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archastro-linux-x64.tar.gz"
      sha256 "2180b84ce10cfb3d0c99e628798b2040bc39cf89966c10284b0130755c052fde"
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

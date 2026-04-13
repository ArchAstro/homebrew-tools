class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.19.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archastro-darwin-arm64.tar.gz"
      sha256 "db43a63e365881d2f095318ba6702f278dcffea2ab766b939f0b53a2092994e2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archastro-darwin-x64.tar.gz"
      sha256 "31f811f521982bfc0b97931b3f2412dc635c2af817994259c613b69cf10c6412"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archastro-linux-arm64.tar.gz"
      sha256 "3598ad14cd804d62129358a276dcc7f3d106f94e391f05ab979ffba0ca2a8037"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archastro-linux-x64.tar.gz"
      sha256 "71016fa6d71555ad9cd039ac7f9bc163dfa7fac08e141675ed4aefc007346291"
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

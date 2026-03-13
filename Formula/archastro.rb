class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.3.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-darwin-arm64.tar.gz"
      sha256 "bbccfccd80d5cf77de68b642bdaccf09eaabc94de51538edf09e4a3e9182dd11"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-darwin-x64.tar.gz"
      sha256 "55b53cec74395eb9798bbf9f3012438e3163c3784a934005faa48744296d6e3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-linux-arm64.tar.gz"
      sha256 "ac627581b44d3a43d43b187e35027f71dc39da93e9994b9f8d0f4026a30fec39"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.1/archastro-linux-x64.tar.gz"
      sha256 "6c7f74368d31d4a3b08b36aa85d885e23b047d468c45551b74916466f59908c6"
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

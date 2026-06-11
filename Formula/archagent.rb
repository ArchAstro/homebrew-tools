class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.37.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archagent-darwin-arm64.tar.gz"
      sha256 "dbbc49767d07976296c13bd715540a889e75b2edf37719d50ae6b185637e4ade"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archagent-darwin-x64.tar.gz"
      sha256 "d0484c42403ab512dfae0403f8d16f5415a65c4e2f2ebf17b32a85125633bae1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archagent-linux-arm64.tar.gz"
      sha256 "8f56b1112f3a5e4a3aa3a52acaf44ca96bd339521ed4cd3f43ce780542a1a8d1"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archagent-linux-x64.tar.gz"
      sha256 "53781c8631a0400b61aef8567131765bfe545fdd5473359ddd0f167453dc2211"
    end
  end

  def install
    bin.install "archagent"
    generate_completions_from_executable(bin/"archagent", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archagent --version")
  end
end

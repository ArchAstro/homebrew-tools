class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archastro-darwin-arm64.tar.gz"
      sha256 "a3f18c276d9d358e8927fadd893cf338df87c03cef58a1be36f7ed2ca14e9d76"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archastro-darwin-x64.tar.gz"
      sha256 "00e84b8139490733b931d3e245dbdf3c982a073530ece80d787e6a8d154b06a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archastro-linux-arm64.tar.gz"
      sha256 "9064ad732784879599c824d7e8811bcc6d578051d3198efb1c19b6d8a14ae434"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archastro-linux-x64.tar.gz"
      sha256 "6960ce0208761fa6d3574f2280f22acdc8780c79e8952d71dc8dc994ea4fd08e"
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

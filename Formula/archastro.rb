class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.49.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archastro-darwin-arm64.tar.gz"
      sha256 "b4acab2878cfb2082226799ff6e59c0e2af5388fdd47eb31b3b5f88d23c26a39"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archastro-darwin-x64.tar.gz"
      sha256 "cfcd1c9a661087dd449dcc6084588669d125b6f4565177b640c1a9af1a7538df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archastro-linux-arm64.tar.gz"
      sha256 "858a2120ea4cc258b84fb92b5629fdedc25bced53033405ac941812b80c60900"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archastro-linux-x64.tar.gz"
      sha256 "73c94f4a59843ea5270fdfc1ccc5f0ca576f525152d24c8c62cb04057fd207a4"
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

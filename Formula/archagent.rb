class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.10.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archagent-darwin-arm64.tar.gz"
      sha256 "54fcbf94f616c15bb8b8e6959acc5512a58fc5c35fb68119e7212de78846ce3e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archagent-darwin-x64.tar.gz"
      sha256 "60824e274f4fe137d1670ecc314ce3b88f5cdb6dbbbfc02ef9ee63085ed272a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archagent-linux-arm64.tar.gz"
      sha256 "43849e99b7293aaba0fd32cabd9b49aa8455da4ebefc9f108dceb888603934c8"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.10.0/archagent-linux-x64.tar.gz"
      sha256 "56677f1bd3dc0cd1cf3c034800a7f33635cf5097f30d2948cff1eccaf5d09dcc"
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

class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.61.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archagent-darwin-arm64.tar.gz"
      sha256 "8368571e55114e1c0b27c087dbef500dd1b3141e595819c56f10cd97d943cc79"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archagent-darwin-x64.tar.gz"
      sha256 "bfb0802f4436bbe46ae6ffbdddb6d831fd7d81134bc40e7d4b60ef7951a63efd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archagent-linux-arm64.tar.gz"
      sha256 "644c3e6c72f3eafcfa06f48896cc07e0ba2ed9f983781ceb7420dea26bbc48cb"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.0/archagent-linux-x64.tar.gz"
      sha256 "1b9b1756ec389af4e98ee9cd22fa06041952772c17b2e0c00ff343abbc0d4ed5"
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

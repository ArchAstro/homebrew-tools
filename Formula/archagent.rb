class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.23.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archagent-darwin-arm64.tar.gz"
      sha256 "c8a942605791cb650e3d2e249b9beab6d3ced7cb0b828d3c1e2fd3b123a7b665"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archagent-darwin-x64.tar.gz"
      sha256 "cb0a350a4be69f47217f7d5e90c52c1fcf3bdfe78b43148f94768c19cd9512fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archagent-linux-arm64.tar.gz"
      sha256 "d3043db95f6593ea3cce7ad7ddc40938301a4b73afc3856fb3093796f438836f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.23.0/archagent-linux-x64.tar.gz"
      sha256 "3c9eb9f3b69d6096aaa48902620e0aba9d86c5b2e94be57f35b157ff0de455e2"
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

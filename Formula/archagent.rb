class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archagent-darwin-arm64.tar.gz"
      sha256 "4a006a3d204a803e9924d65975240dafa2af5efa5ffa6c9667a9c59609346c1d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archagent-darwin-x64.tar.gz"
      sha256 "3427b50965ddb75b59a50861f85af3148d0249a053e6ecece8f435475597e332"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archagent-linux-arm64.tar.gz"
      sha256 "026d0cd4ae46185d362fb315d4520dc6a5378abbe5081cae38f2a145d5f74b65"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.1/archagent-linux-x64.tar.gz"
      sha256 "c8a255951583da06fac8cf372b92e9683ef4cf8f8ef05188dcc8a5f39c6563eb"
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

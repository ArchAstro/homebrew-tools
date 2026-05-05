class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.31.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archagent-darwin-arm64.tar.gz"
      sha256 "24cea8f67e737006d56a0fe6e28fc4ea75cf6539bffa7bd612a8a4e5f6f8b67c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archagent-darwin-x64.tar.gz"
      sha256 "1db6837a552e05a8a15294561b6794453a8423b7200140addba0c260f57d9e5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archagent-linux-arm64.tar.gz"
      sha256 "e72a18caf5b0c513524a4c85e523fcde8d00c5deb7084929a4e23457f12cd9b5"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archagent-linux-x64.tar.gz"
      sha256 "c6276d6155da5264bd2fc32dd57e01ca8c970ff9f4d763a63d0c9e4bc5582314"
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

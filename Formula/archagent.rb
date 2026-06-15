class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.39.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archagent-darwin-arm64.tar.gz"
      sha256 "7d9359f3040fdb8d0b52c158951cff234dc71c8b8fc04f84570e60643096a7d6"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archagent-darwin-x64.tar.gz"
      sha256 "be76e7184b1991ab0b24c6585b580d9b7ba8e3aa7f9b3b26f77c629760335fa6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archagent-linux-arm64.tar.gz"
      sha256 "0456984368e3dc8bcd1698bea28c14e4c77d69cf2ace5445a6f77dc2052924a4"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.39.0/archagent-linux-x64.tar.gz"
      sha256 "d2cc7c362b924c97cf013e5127df20c5b6ce8a2c28d4e046637bc72b16a06bd5"
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

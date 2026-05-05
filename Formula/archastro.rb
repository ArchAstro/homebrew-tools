class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.31.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archastro-darwin-arm64.tar.gz"
      sha256 "8e353623bb5d6e58b76996412b1252b64dfe3264762273f4f6d3f4cc3e1c62cc"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archastro-darwin-x64.tar.gz"
      sha256 "eb4789c5f020e0220510622088a081d582fdc68a6dd601f1f3aa81f982839ffc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archastro-linux-arm64.tar.gz"
      sha256 "a621dd27df750d12aff44f5e306a0b50d2692910ee21e8dae38e4f01e331a8ab"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.31.0/archastro-linux-x64.tar.gz"
      sha256 "4321bf7e66facad25b1b377ec156dc1e7cfd467249fc0fcafaedac6a70e6052d"
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

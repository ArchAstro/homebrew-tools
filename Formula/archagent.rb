class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.20.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archagent-darwin-arm64.tar.gz"
      sha256 "bce6d6128d6fe70e031948f484befabde6732c55eaa98b5caa742cfd6d7899e4"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archagent-darwin-x64.tar.gz"
      sha256 "0a450501dd75d3915e4ef0833cc1f52dfc16f791ed4ddc3e519b9e2c999b6a00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archagent-linux-arm64.tar.gz"
      sha256 "a97f01ce25a867dc99312e8fc46d2ec0ac5e019f9a90efba9e073c7593ca68d6"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archagent-linux-x64.tar.gz"
      sha256 "7489b0c27758aa792ef6e6315e80a3db88330f19d44ad5d1b357ddd4399225f1"
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

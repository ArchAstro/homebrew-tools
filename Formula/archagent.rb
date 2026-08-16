class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.60.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archagent-darwin-arm64.tar.gz"
      sha256 "c4ca391a5de7c717746c82903901b69be2a3142d5074bd3ae596ca3d3b4a84b4"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archagent-darwin-x64.tar.gz"
      sha256 "d442e9cb874e5707a42515f32a8c3fb46b69e55c678dcc0874bbc3f96b096fe9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archagent-linux-arm64.tar.gz"
      sha256 "bfedd70dad1462f45c5d3c597a2477b31b880e94e399c03c3f903cd86a211899"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archagent-linux-x64.tar.gz"
      sha256 "5fff0168a382e3b8f6b3e3e4466a36406dca9aef3d5bbee041a87f7d5b573a84"
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

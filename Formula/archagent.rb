class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.27.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archagent-darwin-arm64.tar.gz"
      sha256 "71edbd50f4c3a2fba5947a9c26353ce91b30758136e160f3d2dd052e05160624"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archagent-darwin-x64.tar.gz"
      sha256 "b3cc0df550611557e09bafe6b1736d5ded73a43048fa2bd60f3c95e2d9d410c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archagent-linux-arm64.tar.gz"
      sha256 "24b7272ce0967dc6880eef0f5947ad453dcecb5355555bdebd482f4911f13c0e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.27.0/archagent-linux-x64.tar.gz"
      sha256 "91e83310c8bf035aff5353b0bde14ea068be820c83abbbf6e8106ea96cd2aa27"
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

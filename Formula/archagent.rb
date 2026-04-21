class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.25.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archagent-darwin-arm64.tar.gz"
      sha256 "7867b89cb7e210126b516f269733f16196c5567af1c0ef7b2ff2075658dba201"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archagent-darwin-x64.tar.gz"
      sha256 "a63593ab270b0c8436f17bb0c74387c5ce3b6a75a7be33b67c909f9979182868"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archagent-linux-arm64.tar.gz"
      sha256 "702a7d6781d7cca903d5dc04a5117a8cd80bd5e1bbe9e7bbe8d6797a1658aed3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archagent-linux-x64.tar.gz"
      sha256 "65e2e6a2ff478598e3508d4387b4734d39e99180d48b6f1ab6a89011b1c7c140"
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

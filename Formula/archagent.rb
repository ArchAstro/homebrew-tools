class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.36.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archagent-darwin-arm64.tar.gz"
      sha256 "e700346b0ac012549d908f15401c7aef0204d8baad124ca21b9105d5bab6ff2a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archagent-darwin-x64.tar.gz"
      sha256 "77bf6f20309923962e83491b9769324bfae02a9bc842c0459e2c8ce7d7556fb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archagent-linux-arm64.tar.gz"
      sha256 "740aacc21c33c8e675b03c78e78724bec38ca1b2d997cd11460dfc5e3df0d89d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archagent-linux-x64.tar.gz"
      sha256 "562cca0a80b81af7e184a1ea2a277927ee8edfa705d8f46d2de625739d855f01"
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

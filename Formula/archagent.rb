class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.17.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archagent-darwin-arm64.tar.gz"
      sha256 "1da2a21e69a2a46b7fdcc6c6e6587afc66c9451e22eba04220be19a76a21cdcc"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archagent-darwin-x64.tar.gz"
      sha256 "3fbadc1b5d28fc9eb945ba0c96e4e22c48861b4e2f2dc9cefecf55e0c1fb16cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archagent-linux-arm64.tar.gz"
      sha256 "3961c4b0506e59612cd2069ad95d1ac3ac8d415461ee122c6a49161d1e0fdb1e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archagent-linux-x64.tar.gz"
      sha256 "fefbd8cbf0f6a676688f84d8ec628492207f9390216e85476d65b282fd75990b"
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

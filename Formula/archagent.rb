class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.34.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archagent-darwin-arm64.tar.gz"
      sha256 "f14b8606cb6c28bb56569c067e7b5c07dd5b8212179b8d91d9a6e12b70341ce6"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archagent-darwin-x64.tar.gz"
      sha256 "6eff450555c119b6c201a394072c528505c41d75f3170b53261e7d96eb8eb8a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archagent-linux-arm64.tar.gz"
      sha256 "b06ea70932915a6774775fd738ca4b575c188f2556b2fdf903e881d89cac299f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archagent-linux-x64.tar.gz"
      sha256 "d724cf6930ac9d2ab7e92a75b8e059214ad4c3e28d69a89131688d70f8762205"
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

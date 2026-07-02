class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.48.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archagent-darwin-arm64.tar.gz"
      sha256 "465b8afbdff468f352a0ff495c57bb4635c7f8dec67952a552fdcfecce3ffa3e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archagent-darwin-x64.tar.gz"
      sha256 "18023b9cbf3bef0e59ed704d8ef2699db3dbe8f3b8d8d902a965f9dfb1b9bb33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archagent-linux-arm64.tar.gz"
      sha256 "eaab53637a2aebdea4669efe35a087e4ba34c473d33b44a41084d6613b6288d7"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archagent-linux-x64.tar.gz"
      sha256 "9eb398aaea9b60f4cae3eb413eef66fa7222d0f68a918a2626a303979c0c657d"
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

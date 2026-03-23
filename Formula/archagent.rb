class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.6.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archagent-darwin-arm64.tar.gz"
      sha256 "b35499af18a74a66a660b766ede4de4854d6a516470e08ceeabaed10aaad6a07"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archagent-darwin-x64.tar.gz"
      sha256 "7ad205d8430db54ff180681b7fb893e5524bb66554dc7dad3d10a6cc9ce7f28f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archagent-linux-arm64.tar.gz"
      sha256 "17813323208626b4eb0337594d2184ada53072f0f6c80baf5ea7f19725432375"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archagent-linux-x64.tar.gz"
      sha256 "a87c5723c2e8c2c4a01c8385971c79087e1250747e1eb190a03d475100d8c2f0"
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

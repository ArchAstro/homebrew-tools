class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.55.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archagent-darwin-arm64.tar.gz"
      sha256 "98cb16241b6201be6fad75725b7ae8bbf1ef8ecc828eba8863193ae74095eb70"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archagent-darwin-x64.tar.gz"
      sha256 "fb2f4d9148c3e1aa2ec6783d2b73677a8a6385a4233fa7067ad23ea4bb55b57c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archagent-linux-arm64.tar.gz"
      sha256 "4e7f9c82a6ec2218c9069445191b955bc7ee59ca9f703c8260f7d6a2b044f938"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.0/archagent-linux-x64.tar.gz"
      sha256 "5d3ed4bec0d49bcb3382af6fb9aae17019121a4b42cc5a10a4f3874204cce79c"
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

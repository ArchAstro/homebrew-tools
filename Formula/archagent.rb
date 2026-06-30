class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.45.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archagent-darwin-arm64.tar.gz"
      sha256 "21d25138d1a7ec928669133228a71b06eb3770a7a1b8054eec50b975ada95359"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archagent-darwin-x64.tar.gz"
      sha256 "1a478239907361fcf573cf265024bb6b2e071e34f2194f4cfc3ca28411e4c27e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archagent-linux-arm64.tar.gz"
      sha256 "784415a589ab3a8bff32b0b2df4f9dce21a2971f2f7b063a8ca626414dd702b9"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.45.0/archagent-linux-x64.tar.gz"
      sha256 "a4fc4fc5bcf4c304c399dd1ab296704cba84572d5aa6f417d4dc7e41c6908c55"
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

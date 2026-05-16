class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.33.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archagent-darwin-arm64.tar.gz"
      sha256 "e2bc09c50b54455ed32a444539ca53e2499d466efe5ad774b581a69fa5a28416"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archagent-darwin-x64.tar.gz"
      sha256 "8c83016db92290ac828b05172408d4f380702ae64f88e20cd74789c9b3f986d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archagent-linux-arm64.tar.gz"
      sha256 "d06d6d69fe6eb83fde2424b1e38517202b2ad1891ab83ba8064e122ef3c75110"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.33.0/archagent-linux-x64.tar.gz"
      sha256 "dcfca99a24f880a6f478b6c7e842c445a4ef6c6f3294755656dcb49707d7d056"
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

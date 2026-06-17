class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.40.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archagent-darwin-arm64.tar.gz"
      sha256 "b17013f176b04ddc7b12fa82bab453455ebf7692145f48deff37b8979ca1d162"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archagent-darwin-x64.tar.gz"
      sha256 "a5a1042580e47558db622ecf4446460cf7d6e7f2d80564b7212ac71b3b47fcf2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archagent-linux-arm64.tar.gz"
      sha256 "e3262d4fdded9b84a22ea28708045c85e952cc13684d38d4a92c7678be5acf77"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.40.0/archagent-linux-x64.tar.gz"
      sha256 "0f6251b881d0b011c433a660e7f5d260f53d6dba82ced50237d1da4f12879310"
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

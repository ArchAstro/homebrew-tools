class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.13.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archagent-darwin-arm64.tar.gz"
      sha256 "c23845aec5a326855cacb84ff5cf5b03169d52493a21cb08435092d4cd1559b2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archagent-darwin-x64.tar.gz"
      sha256 "310901322aacf08a1bd5cf199739e7261b70fabe13dce689e6269cd0ff427ecd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archagent-linux-arm64.tar.gz"
      sha256 "245af545ade78b8cd26c5689ec3502c7e5658940dd78b66d25b9e11ecdc4f021"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archagent-linux-x64.tar.gz"
      sha256 "a8f83cb6ec4197d855ef024f1984c68f375807c6416a07f9251353d40daf2684"
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

class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.61.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archagent-darwin-arm64.tar.gz"
      sha256 "d744e80d06c1bbfe391ee1b736f8cb8b3506c82b4faebbc9882f1dbeb1db784f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archagent-darwin-x64.tar.gz"
      sha256 "ca03aa67cb8b37b1e82168391ec42da63ecfda2fd3f93b3bf10eb6fcc7c05fc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archagent-linux-arm64.tar.gz"
      sha256 "d83b8a6fe9c4f4b88de5f65a0a9896981b77d20a6e01f7878f4ab39bf2664872"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archagent-linux-x64.tar.gz"
      sha256 "56e14c70814f49ab9476d10a12817fc936ba44cee6045e070970081acdc7edab"
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

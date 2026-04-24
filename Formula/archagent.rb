class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.28.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archagent-darwin-arm64.tar.gz"
      sha256 "c81b0af5157f95aeb3f9e86f3d30e1614b186a1ae9f340ea6fbaf86d1137a84f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archagent-darwin-x64.tar.gz"
      sha256 "7d9db0c377ca821e2b22f2085f82e30dff3630c31dc0660cedda0166c2647529"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archagent-linux-arm64.tar.gz"
      sha256 "72ef67f9ca0f4ddf1afc28b76b7c951dc4512ccb3d290e7e59967dc4f50c6c6d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.2/archagent-linux-x64.tar.gz"
      sha256 "1d24616d50814b77e83a5836423eee73e41ac9f3346648e256adf531a8dcf512"
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

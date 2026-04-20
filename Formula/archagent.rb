class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.25.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archagent-darwin-arm64.tar.gz"
      sha256 "652c65ccddfe931e7285404a9020dc1f8214bec8cb6ddfa2679d0466b7c3c1ee"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archagent-darwin-x64.tar.gz"
      sha256 "cff8f0b80a1b36d280227ce80d1e1ee0d4458af13946cdda3bbf4e20eab64799"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archagent-linux-arm64.tar.gz"
      sha256 "1c6986087436b27a3bfc0e3168fc241ed3ecff12ef01fda0df9e75ae577acfe1"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archagent-linux-x64.tar.gz"
      sha256 "6afe0bcc39e473c18610b35848a0b253024b8ad772f4b894b19958ae0ebc5ecd"
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

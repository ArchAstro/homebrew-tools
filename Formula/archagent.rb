class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.12.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archagent-darwin-arm64.tar.gz"
      sha256 "2eeb56fbca2c1d75bd4036dfa91ea8bdcac732e4dece4d8097adfb3e644dfbce"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archagent-darwin-x64.tar.gz"
      sha256 "e12ec92de43d6713af2690a375a3dea9ee412cf93c075fd0a9ef9dadee7a0b86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archagent-linux-arm64.tar.gz"
      sha256 "7ee3a5e9c3c6783f6d678194b39bea573bcf8b32bc36d88737d351fed4d98fc0"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.12.0/archagent-linux-x64.tar.gz"
      sha256 "6286380c7e508d0daff0a092394b1109bf16041bd0097df70768f2066620b80e"
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

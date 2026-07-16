class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.53.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archagent-darwin-arm64.tar.gz"
      sha256 "fe4a42efb7119af88a54c8c7016bbaf4b42315241f0d1136fcd0d5950ac910a5"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archagent-darwin-x64.tar.gz"
      sha256 "1944bf64416fe99600249b81e18760f15bf748c9084384a12bafe91a44cac996"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archagent-linux-arm64.tar.gz"
      sha256 "cae30ae167c79f6f181082afdf2da52191f940a51e35b3bbe40710ff9fcb0558"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archagent-linux-x64.tar.gz"
      sha256 "e753406c43e99273170e48a3bc4707590444a78822a154abbd3e5999c935a314"
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

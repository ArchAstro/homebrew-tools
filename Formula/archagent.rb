class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.26.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archagent-darwin-arm64.tar.gz"
      sha256 "b1f8e9dadce4ed3acafbbb6e66ccafccdd8e8c3b8e311b7c51e5ee9bd461c34b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archagent-darwin-x64.tar.gz"
      sha256 "c81b65532dc402f1dda5580d4918101be262b39b06515ff9a8f6955cbb081696"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archagent-linux-arm64.tar.gz"
      sha256 "066824d9b39ead9698056573a37121d2325827684dc9ba11e47abf24d245f554"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archagent-linux-x64.tar.gz"
      sha256 "6cfcd527984d80d84b335d50fee795ddf9f11e9b22cd9aadf4b1bcb8735f79d2"
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

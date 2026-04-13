class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.19.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archagent-darwin-arm64.tar.gz"
      sha256 "8e253cad1a82019591277d6b3db8f560f785a13c3488a778d27c77deb8d7f114"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archagent-darwin-x64.tar.gz"
      sha256 "b0f1aba774b451d8ee0e61a4a68b587eed68a9965654e659ee7553388d1748df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archagent-linux-arm64.tar.gz"
      sha256 "ea513712e84e59bc945feb586a0d756cdd41bfaa608b25f29d81f83425ded145"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.19.0/archagent-linux-x64.tar.gz"
      sha256 "0f4f0ad5f10df1efd502b0b74fe85e5da4aa53d080fb04966c85767baf07c189"
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

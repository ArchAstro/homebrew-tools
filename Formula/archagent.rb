class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.9.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archagent-darwin-arm64.tar.gz"
      sha256 "4abfe22b59106a83cf9662d53fe25322348c906bc291d9e90efbee6c138af405"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archagent-darwin-x64.tar.gz"
      sha256 "61eb8ab7a7e0c7988951b0266765be13be09edb8190b150e414cbc2ff5e6e88a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archagent-linux-arm64.tar.gz"
      sha256 "f0e465872d3a226a34ce979efd615399c9757a74458a6543ff4ccdfd9bfcc220"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.9.0/archagent-linux-x64.tar.gz"
      sha256 "67156fe0b92de3f0d56eb94d714534fa39e0aa3dd50e10a858642542974b6208"
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

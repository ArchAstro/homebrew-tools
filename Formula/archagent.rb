class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.38.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archagent-darwin-arm64.tar.gz"
      sha256 "e70789f688029076dfe2a88ddc0bed2c2391576a91fbfbad5ec991d77fc251da"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archagent-darwin-x64.tar.gz"
      sha256 "959c7a6ecd35e85f856f833bbbab8fb858e18f24e2225170bb980105ec8681b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archagent-linux-arm64.tar.gz"
      sha256 "f9920d1a2c43241df9e442c3d783f9f49c6cd35f84b930005bc0f417cddbe5c0"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archagent-linux-x64.tar.gz"
      sha256 "527a029cbd05ead8b7150ec06382ee4dd176c5c0d1bdac0074c4d5df9a9e22eb"
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

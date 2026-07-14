class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.51.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archagent-darwin-arm64.tar.gz"
      sha256 "ca4270e845f6afb7ccd38dbea0f7bba1dd5d8ae0c049e82de16680f4f2e48fa5"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archagent-darwin-x64.tar.gz"
      sha256 "de170e079848a8934bd86cc9f4b05d3882ec1bed62ebe723c842c1af206abfa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archagent-linux-arm64.tar.gz"
      sha256 "223661b78663d5c3950f8b74a827a1d6d2a449372b243fdbd7f5ee51a7e2ef4e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archagent-linux-x64.tar.gz"
      sha256 "abe6d9a3d191b9c203569ef390eb2e91deae70a39818a3600789ab3ad765126c"
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

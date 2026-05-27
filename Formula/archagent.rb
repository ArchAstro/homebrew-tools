class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.34.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archagent-darwin-arm64.tar.gz"
      sha256 "b88be821fdd8cb907440f70b593a32e3bde3906afb3d6928c72bf7d388496b45"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archagent-darwin-x64.tar.gz"
      sha256 "e6318673f08c1e5f4de0aa5bc14e5eafbc53134d3ebc57cf3c2569c13d334d88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archagent-linux-arm64.tar.gz"
      sha256 "01b3e07605d6a221c0fb0e0bcb7d5fa22b7e4527a8236e398a18fc4c64a224c6"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archagent-linux-x64.tar.gz"
      sha256 "5fd420a484c16430b57b65b7acc1e425a877d89a0aee1a7955cebaaafa60cfeb"
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

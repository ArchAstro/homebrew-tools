class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.60.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archastro-darwin-arm64.tar.gz"
      sha256 "aab830fec3ebca7bd07579bbc0d8b999cf371b4113004d53b6655e959db045e5"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archastro-darwin-x64.tar.gz"
      sha256 "2373fabbbe420db96d4a3ee40859bfeec341a00e34e5dad07cf95dc003621277"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archastro-linux-arm64.tar.gz"
      sha256 "2331b71e50d4f153191f3c0f7a80d32ce7fedba2d26a38457d017cd1e58ab3b2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.60.0/archastro-linux-x64.tar.gz"
      sha256 "a0e6ace734adde1e4dc6d7d75891c933481fd630ec8a69d2f91b6fcd94a8fcd3"
    end
  end

  def install
    bin.install "archastro"
    generate_completions_from_executable(bin/"archastro", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archastro --version")
  end
end

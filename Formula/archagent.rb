class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.54.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archagent-darwin-arm64.tar.gz"
      sha256 "c3b6026eb5db9c333116a233ae3455299e2c7ab85769d2faecdb97cf7e5dabc3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archagent-darwin-x64.tar.gz"
      sha256 "e1f491b08c051f148185b4c9faa2d5fd4eba487436a745fce3c97cc528e6deb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archagent-linux-arm64.tar.gz"
      sha256 "26215f6cd6c544216e8d344cfc62c6cd1ec4e4770f1eb2b659551ab9ed2aabb2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archagent-linux-x64.tar.gz"
      sha256 "33492a1fba1c36c6ab5271608b761c1bec2a6a3266d04bb8a4922e085d25fbab"
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

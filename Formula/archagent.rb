class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.52.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archagent-darwin-arm64.tar.gz"
      sha256 "ae2992de82cdfc7059d4e02d63a9abe2b18280a79f49bbdd8bdc0154aba72449"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archagent-darwin-x64.tar.gz"
      sha256 "c7796c6a59f9bc459ea41e1d2a12dcb19caf7d2ee42379d8826b3ae23afb3c6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archagent-linux-arm64.tar.gz"
      sha256 "338cdc32ca8ca9b25d6a6b115cd1f5015956843e0d52c350a43c668b9aaa3bbc"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archagent-linux-x64.tar.gz"
      sha256 "77a3bffb9031324a6a6b0615c8dc8072bc9ba0c3e2d086d8b95f2e6ef5370c5e"
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

class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.18.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archagent-darwin-arm64.tar.gz"
      sha256 "ea98e1061d069237ce95a32e0b5662efed4ba7cb9d68fb2ef2ef6ea25fcc64b1"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archagent-darwin-x64.tar.gz"
      sha256 "99092d62d8805197fdbe5991e78b967c96f3bf913faeb5b52011f887aa874148"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archagent-linux-arm64.tar.gz"
      sha256 "b34b066634b5bdf4d44b8ea6f11c24ae8f548a41be0c67ca6c01f87da340070a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.18.0/archagent-linux-x64.tar.gz"
      sha256 "3448ff94ad985a256bad98dcac41347ab04690bb840040ae7c2058eaf21cc2d9"
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

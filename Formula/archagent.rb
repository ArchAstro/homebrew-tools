class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archagent-darwin-arm64.tar.gz"
      sha256 "d5b091a1ec27a569d9fc0414d47632ac59b7f9a934a3dd926e21e3f8494ca7df"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archagent-darwin-x64.tar.gz"
      sha256 "0143b8227e1a34f7ed1e72b8ed6de3c4897e913f9c092d8d0000fed39510c1cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archagent-linux-arm64.tar.gz"
      sha256 "5a680fdce23f21a80fda5e6dab71f4064ca3e0b77edef21156d672b96afb5b81"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.0/archagent-linux-x64.tar.gz"
      sha256 "a21a25b12fda7122cdb733a1ff10af43cb8b8880dbf54025581ce32c307ff104"
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

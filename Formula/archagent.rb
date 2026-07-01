class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.47.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archagent-darwin-arm64.tar.gz"
      sha256 "13c583a8e457e3232fe63ad503db0c18bb151be167e1e9939f70668330686ad5"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archagent-darwin-x64.tar.gz"
      sha256 "c365a253c6b874be8c122080c28cfa4152325351f5b059a68dfbe4ddad0143a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archagent-linux-arm64.tar.gz"
      sha256 "958c8c5d8cd595bae3a99e2e51c60e13a32bb7fc7fd955c23851fb414fb735f2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archagent-linux-x64.tar.gz"
      sha256 "be289785eb3382ffbb177d8839c981925c741d38a0803c5782f8d5791181d528"
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

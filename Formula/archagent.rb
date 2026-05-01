class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.29.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archagent-darwin-arm64.tar.gz"
      sha256 "783e8c17034aeff9fee429681586a26cca0c86fd0740f6fa3da09f39093714a8"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archagent-darwin-x64.tar.gz"
      sha256 "00b671a22896eb5ec9e8bdc334b9664acd1a704ac0829f4c62977c461892428e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archagent-linux-arm64.tar.gz"
      sha256 "8a38e6e0cc4dd9775a5d0920375ec6c2aa6bcaff6214a83a7f842fb73cc73052"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archagent-linux-x64.tar.gz"
      sha256 "a63b1d552ae0a6e7b12a65b14975942bea82f4423d1c7c8dba2d626cdb5b3c11"
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

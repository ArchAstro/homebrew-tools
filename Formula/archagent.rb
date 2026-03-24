class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.8.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archagent-darwin-arm64.tar.gz"
      sha256 "138707f3cfd7eaf3bc0af33c897186f8fe7ca981d0c56870cb2df78bdb2c998b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archagent-darwin-x64.tar.gz"
      sha256 "32113a184eb8906ef52b89b2b319c433334471cacad6d3a7cc1ae5fbff0bb834"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archagent-linux-arm64.tar.gz"
      sha256 "30eb512279a062d373483edf69b392614080895a52d069de455c93097eb91e6c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.8.0/archagent-linux-x64.tar.gz"
      sha256 "a20c1b992ba698282dab389971b37b26e4d497bf378b689ddfcf07116d8d28c1"
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

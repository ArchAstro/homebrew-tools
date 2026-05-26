class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.34.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archagent-darwin-arm64.tar.gz"
      sha256 "c3e312ebb3d6b7533a810f5b568aba86f7e0d40332d5f995152c0d8ed3e4035b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archagent-darwin-x64.tar.gz"
      sha256 "7cfabf65573a3dbbb0c867d6d6f3b0b849a70008bc7d357852baeaf02ca7c562"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archagent-linux-arm64.tar.gz"
      sha256 "c4465cb7371aec615fd4dc582f0cc080ea8d5b8daa2e6c8e978c230aa28355f3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.1/archagent-linux-x64.tar.gz"
      sha256 "c4e7cd6116a46c085fc6734f21e35de3de4e38a6f475d2c8e7bfcdfbcbca6cf2"
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

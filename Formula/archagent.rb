class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.7.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archagent-darwin-arm64.tar.gz"
      sha256 "c0485fbae627dc8b5a9e37eddfd33708b93d45cffc72d9cd6eff742eb7613c26"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archagent-darwin-x64.tar.gz"
      sha256 "1f392436bde0a6054e9156e2e4c981380ba7bc8d16d623a596c33ee8224c98b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archagent-linux-arm64.tar.gz"
      sha256 "26ef8efaa67a50119201a4864810831b67ff3417253aae2b75763e1091a18dee"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.7.0/archagent-linux-x64.tar.gz"
      sha256 "19d696b9847bfcd8962ec0454b36e2b0e12d817f3ef855ee8ff1e571ca6b826a"
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

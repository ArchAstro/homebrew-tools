class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.59.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archagent-darwin-arm64.tar.gz"
      sha256 "5003ddb0ecdf08b55fc83a5498ebd611e445d2ba1439ccc24f41c7119c8036ae"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archagent-darwin-x64.tar.gz"
      sha256 "407538cd8558acbf21cbdb8a5c38e8c7470a93b0ace65fae2eeada7b3621c0b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archagent-linux-arm64.tar.gz"
      sha256 "c7cb18e83943115fff618cd39f54799d7c74d0c1c30010da0bd555adb7f60ca6"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.59.0/archagent-linux-x64.tar.gz"
      sha256 "a76c83cea26876356e0179bbb487636bd7f059c18b048a8881f375559d98391b"
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

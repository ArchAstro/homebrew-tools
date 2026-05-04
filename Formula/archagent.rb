class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.30.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archagent-darwin-arm64.tar.gz"
      sha256 "3a393e59ff7f75abeed3c114e7647cfdcd22309f348735aef35fb44a835e24fb"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archagent-darwin-x64.tar.gz"
      sha256 "09d4709f97d0017b5ca811cab88b1d6132460db0b46822e948c4c9486acb8b6b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archagent-linux-arm64.tar.gz"
      sha256 "f0d24d3dbc7f1208a35c291dd1225e12ca03f05c0abf92bc4649e4a0cbe7dd0b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.30.0/archagent-linux-x64.tar.gz"
      sha256 "cbe316bb14e32bede5f46f87ffabbd4c2a4a973cf437f228244f395cda211ac3"
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

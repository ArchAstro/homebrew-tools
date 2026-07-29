class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.58.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archagent-darwin-arm64.tar.gz"
      sha256 "3165c565d2af7fa50b46cec3025b18411fdf2a19460ed8fc757f57600bc05b29"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archagent-darwin-x64.tar.gz"
      sha256 "69d334c2d0b0de09130cb6e892156d2137ecc66f7910b25a6651588e47401d7c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archagent-linux-arm64.tar.gz"
      sha256 "a521107e3d57793fd0a867f689e0d6ef91c7b8135a85c432ffb9193d98379dfd"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.58.0/archagent-linux-x64.tar.gz"
      sha256 "b5e0c44e9eb8e77d73b3e19ebaae5f4dc9b92943aa96e725b238e90736b6a334"
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

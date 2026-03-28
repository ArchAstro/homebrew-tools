class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.11.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archastro-darwin-arm64.tar.gz"
      sha256 "81007544b4864f80751e8f41dfddbac2dab5d49215b1c6466a23e7b8f8780274"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archastro-darwin-x64.tar.gz"
      sha256 "c13d46eab479ac55a954c2ab2fae1f2babd1aa6583951318141f6f6343907eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archastro-linux-arm64.tar.gz"
      sha256 "a47ab2eace4c2a70bb6cb8d0723e3739c52120074fe91289df12f84a264d440f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archastro-linux-x64.tar.gz"
      sha256 "32315a6bf854fd0be89ec94771d56eb3234f508cfc773d6ea4aa9b7cfc4fa23c"
    end
  end

  def install
    bin.install "archastro"
    generate_completions_from_executable(bin/"archastro", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archastro --version")
  end
end

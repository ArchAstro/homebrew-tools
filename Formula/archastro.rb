class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.56.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archastro-darwin-arm64.tar.gz"
      sha256 "9acfce9bcdd5c5dc902052bd099031bfd4df33fc9680ded69baba2a13369da4b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archastro-darwin-x64.tar.gz"
      sha256 "8eaf974551cd9aedcdff31cc54a8dee0fc92374fadb079e16fa3dfc86db9a59f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archastro-linux-arm64.tar.gz"
      sha256 "95e6e92b46ed5fd149a719846eee116cb8c6c2e46c130e92d9c769a49073cf37"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archastro-linux-x64.tar.gz"
      sha256 "75036d16d0c4b8581bbafbd07cbd82ea51de14deae708a9ea95416b566555224"
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

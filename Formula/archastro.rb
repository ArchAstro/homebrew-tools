class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.38.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archastro-darwin-arm64.tar.gz"
      sha256 "432a8d5bd17a2bb39020f550c64c60305d426898faa6b2e026489285d6704a7c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archastro-darwin-x64.tar.gz"
      sha256 "4df4165a137a85d1b682d6a2ef85320dff9caf1fb4ef14afeef43f41440b29c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archastro-linux-arm64.tar.gz"
      sha256 "b184b240ce695bbfa51a064f6a7990cfb6c88990e3a073f5b7f096f89cecc12e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.38.0/archastro-linux-x64.tar.gz"
      sha256 "2998c8966679852befe29aa6e666520a5dce7b2b003da92776fd48e2cc412b6b"
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

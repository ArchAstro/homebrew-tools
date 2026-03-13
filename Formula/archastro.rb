class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.3.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.3/archastro-darwin-arm64.tar.gz"
      sha256 "71cb43269e156bcfe98e6d0c4a3f79be7680706b3cb0475b36ecada6896931e9"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.3/archastro-darwin-x64.tar.gz"
      sha256 "b7bbacc39a25f3a2eb2905f3a1f5fa810b6226ac142fe7a3cca15de9321dd34f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.3/archastro-linux-arm64.tar.gz"
      sha256 "1a7c0b31399f97ae5c5aa00df5f7d3a2ef078f0ad7cdc5c9e5355e644f99fba2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.3.3/archastro-linux-x64.tar.gz"
      sha256 "dd5e3c20aaad3428273a26195c9257433758df7695d78a0771b721e520498797"
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

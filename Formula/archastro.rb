class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.6.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archastro-darwin-arm64.tar.gz"
      sha256 "c4ab423996ffa03030b164dd758a43b74621240bc316369f64e5790680059ece"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archastro-darwin-x64.tar.gz"
      sha256 "2236b05766ae5f062e384bf98e8a43e2b79a46e38a2139bdce99bf94fbbfd397"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archastro-linux-arm64.tar.gz"
      sha256 "e1126cd86a7599a5a49c8b4a49f736d9ab3b1b14701b4b1c7a4a3730a7f9a750"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.2/archastro-linux-x64.tar.gz"
      sha256 "fb4b7b888feb1361b8178e5aafc006ea165fd1c4b05928824396b508885c1e61"
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

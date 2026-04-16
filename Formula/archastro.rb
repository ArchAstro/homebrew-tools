class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.22.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archastro-darwin-arm64.tar.gz"
      sha256 "ec06d7ecb163be73dbb542eae8f7d2aa89f5376ffcc7af64511a24fdeb579186"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archastro-darwin-x64.tar.gz"
      sha256 "af24ee4cbfad574dfa1e6155fe072411e8bc6f2e43f3506cf7dd5c9945bd5911"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archastro-linux-arm64.tar.gz"
      sha256 "f04fa90b4b0a441c60bc156db52ec6e59406c124a7d17a5bea3a2ac007e910d8"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.22.0/archastro-linux-x64.tar.gz"
      sha256 "73c8f6099d6b9bf3fc333f62de1a894a39a778c2dfb95b3908fb2080a8ac9b41"
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

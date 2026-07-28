class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.57.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archastro-darwin-arm64.tar.gz"
      sha256 "4428bdef32dfcae706d0c63b04e8513ecf4f7ddf372834f537bdfaf2c7181a74"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archastro-darwin-x64.tar.gz"
      sha256 "04bf84d4a585dadd1cf9fdbdb732d4c8e9c63da9b8dd798c147b85dc2bd77586"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archastro-linux-arm64.tar.gz"
      sha256 "a43bd64646ff17239a6a95555769f9f36278069adb996f44d816bda99fc5265c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archastro-linux-x64.tar.gz"
      sha256 "ad8ac032f73fa771dc875dd2caef3b38edba865e476010893700af020820d739"
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

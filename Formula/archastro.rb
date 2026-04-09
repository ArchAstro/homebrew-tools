class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.17.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archastro-darwin-arm64.tar.gz"
      sha256 "3a369dfa0137027fd1ff0b5bd4b489fd4a8831b1ef70d876c09160518777a7b7"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archastro-darwin-x64.tar.gz"
      sha256 "89347e618ac982d3b2fdc5b5f05e850a6a260173da30c904efbd91e84a67e695"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archastro-linux-arm64.tar.gz"
      sha256 "e1aab90c796b55d4cd9f36c08cf0567ffafc88bb6b93c100ef2081d07e6a2782"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.17.0/archastro-linux-x64.tar.gz"
      sha256 "5fd1cbe279bc325bbada38bb06d907312bc1c8684f5105ffa5627f940293ac0a"
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

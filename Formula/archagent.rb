class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archagent-darwin-arm64.tar.gz"
      sha256 "00068505e68e64acd230db48f62f8d7930672864da31e9f74d445451de33694d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archagent-darwin-x64.tar.gz"
      sha256 "ef8dc390de77bc88177c5eba1454f0355d0093e4bfd282e5b3b9c376b0c652dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archagent-linux-arm64.tar.gz"
      sha256 "337ddddbddf9c7c2b1971c319ba8f8ef3579dd20ac24b7b5a6d69bda69e0b13f"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.3/archagent-linux-x64.tar.gz"
      sha256 "5251414b184e7455d57566680cd1794750c901249fe71bc64588dc45032c49ef"
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

class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.29.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archastro-darwin-arm64.tar.gz"
      sha256 "629f9f958f10e19ed30874475d5990e23e462d28b6ae52f5f60c8763ad965530"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archastro-darwin-x64.tar.gz"
      sha256 "ae7031d134551e585f6f27480d29c8562af7ec050fc43d6b3c068b24f53532db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archastro-linux-arm64.tar.gz"
      sha256 "6294a86b236155cea4104bfb9ab96ac62f9cef0673de111251982e81b2e5643c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.29.0/archastro-linux-x64.tar.gz"
      sha256 "9580ec47455434a40f9e6a9d38f0150455299fce72af0754e50910386d7d4dd5"
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

class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.11.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archagent-darwin-arm64.tar.gz"
      sha256 "653d49fc5d00458412be2adc8940e23e1f6d9913b396ddc756ad4758c556156a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archagent-darwin-x64.tar.gz"
      sha256 "112592a1c5337abc6cb1f9408340a443edce3f917e5f12a8df86554b89d859f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archagent-linux-arm64.tar.gz"
      sha256 "54b2d3918a8bce9f2395e4887cb932653452d7884a4cb189c6264796548fea34"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.11.0/archagent-linux-x64.tar.gz"
      sha256 "4932318c26f721eedc6cba6b43356013ea93174d983dd744195aeeab5348f8d2"
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

class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.50.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archagent-darwin-arm64.tar.gz"
      sha256 "7b543f1eabd4a0d76b0b61dce33050c96817f3502910527d06eae72e99f73591"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archagent-darwin-x64.tar.gz"
      sha256 "e3a02d7a1d337ea15efe56345bfd658f186d803d228681fecf9d9e789fd75c40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archagent-linux-arm64.tar.gz"
      sha256 "d8a4b84178e6fd15f592f610130bcab737f708a732fb0f598af1d810709caeff"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.50.0/archagent-linux-x64.tar.gz"
      sha256 "0971e8bd749dd5570e417bd65076aa59279462315b758e68e7be95d87356d017"
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

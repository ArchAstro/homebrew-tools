class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.61.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archagent-darwin-arm64.tar.gz"
      sha256 "9284f923200ac509d58b92fcf76fd12db92124a774959ef7e3983840f0c4c228"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archagent-darwin-x64.tar.gz"
      sha256 "b54bb9ea6cdf38496f0af45cb727d191aa1b063bcf9e6dcfd943e8809439cb54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archagent-linux-arm64.tar.gz"
      sha256 "a2ed52c206cae8739b696c7c22e60f069dab393ebca3da09c9755dd2356a9445"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archagent-linux-x64.tar.gz"
      sha256 "22db74b713a0475e0aa0596be77e49067e746e6eb2a1ef984c7514530eec2005"
    end
  end

  def install
    bin.install "archagent"
    doc.install "THIRD_PARTY_NOTICES.md" if File.exist?("THIRD_PARTY_NOTICES.md")
    generate_completions_from_executable(bin/"archagent", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archagent --version")
  end
end

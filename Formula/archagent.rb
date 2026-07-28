class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.57.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archagent-darwin-arm64.tar.gz"
      sha256 "d8ac33e8d224522933f6b85f804b4f51d9fb857eb7637a6693b68e6d48a63dc9"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archagent-darwin-x64.tar.gz"
      sha256 "7b38eedd1e37d384fd65db7ba291f9330c4e2aab065e07ac272c9f236d673d23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archagent-linux-arm64.tar.gz"
      sha256 "4ecec12034067c72163cbfb3575302894391bbc7f6cf83b5c9af20f47826ad0e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.57.0/archagent-linux-x64.tar.gz"
      sha256 "0c5ea2ef4e510883584290a1c9b62dde907c8aac1c8ac42746e4377a2af580c8"
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

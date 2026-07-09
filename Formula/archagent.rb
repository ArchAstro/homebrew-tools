class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.49.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archagent-darwin-arm64.tar.gz"
      sha256 "02adc2063678295aa288122a0d7023d9ee506dff02e92076c7994e5a1d3a320a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archagent-darwin-x64.tar.gz"
      sha256 "d706e9b5eb29bfaa6d1f02da555293295d1e63667260ece411dca356a312f07a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archagent-linux-arm64.tar.gz"
      sha256 "b225700a1014c23d3162dd741ac033b40cb7fddf392fed9849336a3c74e3e722"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.49.0/archagent-linux-x64.tar.gz"
      sha256 "1c168cc20287f713b83fe0cb38d8fe0bc112632a3477484c894c5fa456d3afda"
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

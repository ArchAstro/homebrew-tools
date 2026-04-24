class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.28.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archagent-darwin-arm64.tar.gz"
      sha256 "b2c1f7cf760ac80ee8a11b9ba860c2c21f64ff9e5796116432fcbc995522668c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archagent-darwin-x64.tar.gz"
      sha256 "9d86159bf7eb294853546379c9ec9bbf1060150b8152d4e44d79a99836df6c28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archagent-linux-arm64.tar.gz"
      sha256 "a02f1756e95131f7b12031a46aecc486ba5b81f746abc5c23a305480b18bdfab"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.28.1/archagent-linux-x64.tar.gz"
      sha256 "5ca8e7a0d6fcb2a6d17430e3e112b18d73f49762b598eea569fb77256f55935a"
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

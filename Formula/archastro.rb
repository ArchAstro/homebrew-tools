class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.25.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archastro-darwin-arm64.tar.gz"
      sha256 "0a1625c3a3a5540d9acfbe862100381c5ca78502a21ef0238c9de9ff2b2b8279"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archastro-darwin-x64.tar.gz"
      sha256 "e4340d91f709717a3eb5db7fda1f26a5496d229d57d1579c9e2b8167d476f691"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archastro-linux-arm64.tar.gz"
      sha256 "fb587c1fba27b338f189d501c3dee23194913e7e420fe00feee3ff6c05918f63"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.2/archastro-linux-x64.tar.gz"
      sha256 "cb4b9944248b97c2e83fbb3a75e32451f6946a4c9374063baaa26a7253df4d50"
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

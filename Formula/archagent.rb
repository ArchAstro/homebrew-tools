class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.15.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archagent-darwin-arm64.tar.gz"
      sha256 "e573f81a82bef3cf0ec267511028f2c8055478f4efb5df4d9bae10f3aa63c639"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archagent-darwin-x64.tar.gz"
      sha256 "1c7d0908f85740f52c1792c8430861bc09511a6464cd334942f9d1ee478813b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archagent-linux-arm64.tar.gz"
      sha256 "655a33d32b444bfd8bf8166453ee3a2b9f60adbff9efab306a5f78f2b2e24056"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.15.0/archagent-linux-x64.tar.gz"
      sha256 "9b946656331551704dab4dda2ccd9a369db32fe486eef393d5f851692bc995fb"
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

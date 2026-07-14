class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.51.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archastro-darwin-arm64.tar.gz"
      sha256 "c43ac3b6742f5dfe23c8bcd031f354851adcae822b38fd4047158c1f7c4c0c9a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archastro-darwin-x64.tar.gz"
      sha256 "483c02c840620dce5f5bc07f88ca96d0d63027424dd6289a9c9f6f0b602149e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archastro-linux-arm64.tar.gz"
      sha256 "84ce9d4a708fa9d203eadde4a89f7bae3c84548f39f1b02ce0ab675bf734b50b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.51.0/archastro-linux-x64.tar.gz"
      sha256 "3cb68b5a53ada18fcde0069ef0c8ffee038ce4f8ef0cceaddadf1438e9e40b67"
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

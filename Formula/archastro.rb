class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.61.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archastro-darwin-arm64.tar.gz"
      sha256 "7cd29ea20e731787a898ae7d1952428e05ca5e5f0456031bf0249416dbb47016"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archastro-darwin-x64.tar.gz"
      sha256 "6a9d5289853fa94a45af100aba2e8ffc9a4d983ea44287b1a49921bf4427bd3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archastro-linux-arm64.tar.gz"
      sha256 "a3e9c532e5647bda9ab8788bf652665f488d7b3ffe42ad0b49707118f0c8923e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.2/archastro-linux-x64.tar.gz"
      sha256 "6e219b098c730335b3fdd7c3077e547c994d836c09d34dff969d13a8a335c60a"
    end
  end

  def install
    bin.install "archastro"
    doc.install "THIRD_PARTY_NOTICES.md" if File.exist?("THIRD_PARTY_NOTICES.md")
    generate_completions_from_executable(bin/"archastro", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archastro --version")
  end
end

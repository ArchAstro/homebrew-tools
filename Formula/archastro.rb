class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.6.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.1/archastro-darwin-arm64.tar.gz"
      sha256 "11b08a9b9e20d655c412bd5ceaa9108806b42bf28d0a177337cbe2869fa81ca3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.1/archastro-darwin-x64.tar.gz"
      sha256 "5bc034e3c9071e8a47f0845be5f4a5c4f5beeabd352e756b3fc3dc8be50100b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.1/archastro-linux-arm64.tar.gz"
      sha256 "59dfdc50314cc011d4c637015b41146f42e2a364ea98eb9f8b55578cf17e16e0"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.6.1/archastro-linux-x64.tar.gz"
      sha256 "cfcb1eb78278691b736a63a445a385664a23af8005f27b39ac97b69f44f27969"
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

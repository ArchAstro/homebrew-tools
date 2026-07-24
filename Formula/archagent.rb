class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.56.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archagent-darwin-arm64.tar.gz"
      sha256 "b4c14e9aeca333a45719c1e1cf04513ce0ecc8e8899bf7b1852f6524f29d7e03"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archagent-darwin-x64.tar.gz"
      sha256 "66bbeb21a817fe2348881abdbe964af478a5e961d07e2f34db50a9720e516429"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archagent-linux-arm64.tar.gz"
      sha256 "831ab077b3e9e7436823229a8f9a900758d001455c946b430a7f34b46704f90a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.56.0/archagent-linux-x64.tar.gz"
      sha256 "fb1d5eef6a8a58f0cbc08722b778d11aa01a91d39728daf3f1fa58e4b528632c"
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

class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.43.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archastro-darwin-arm64.tar.gz"
      sha256 "d5b470bd4408be9d05b235473165e3b32b66a8d051b7157da40d81f211a33146"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archastro-darwin-x64.tar.gz"
      sha256 "283095a9facfc08629fac09361fea14d63c607d14768a477d13f4d572e9b7a68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archastro-linux-arm64.tar.gz"
      sha256 "ad0412dcc1d0e3779801aab0b531d9cd3af8f773492c7a7616eed56f36f6e295"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.43.0/archastro-linux-x64.tar.gz"
      sha256 "ed9846b5febeaa5bf05c9d647c66030423b5ae64d1e570a401d78ac798e257e0"
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

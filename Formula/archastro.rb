class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.34.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archastro-darwin-arm64.tar.gz"
      sha256 "34e5ebd1130de533025da6a20832e55f8633847d784777d299d66e1bf36b6651"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archastro-darwin-x64.tar.gz"
      sha256 "da81ede7e8c09ab23135c358d7e94fe1eb6ff4ec26eda3c78fe547153dc5a9f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archastro-linux-arm64.tar.gz"
      sha256 "54674d40608c355dfea9ad24a3a4642b8b071c41d5bcd0422e6c6a55482c3e22"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.2/archastro-linux-x64.tar.gz"
      sha256 "f36eceb1adffd502cb69d25ae1a87f4fcc9efe131c0847c773a5fc6bd6c30a84"
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

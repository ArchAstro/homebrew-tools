class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.34.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archastro-darwin-arm64.tar.gz"
      sha256 "38b9fe25de0a466c741482d2b1090e3f0a81fc16f1d2970c8b9f57784fb17c1a"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archastro-darwin-x64.tar.gz"
      sha256 "68ce2363c098c371d9b12acdc20b551e1fdb162df623170e9b61124e93d109db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archastro-linux-arm64.tar.gz"
      sha256 "8929b0233eb50cc2f7fde28e4cf813bca04cdcd7df5110f8dd4a0895c57d4bc8"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.34.0/archastro-linux-x64.tar.gz"
      sha256 "12a19fcca0095d36be61b8dd359416c8475501cf00ba49b987a3c72be77aa95e"
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

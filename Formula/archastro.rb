class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.25.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archastro-darwin-arm64.tar.gz"
      sha256 "6df91deb484f23cf74ae54016d3dce3329ce8ba5bda340250eaa8f75fa35e5c2"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archastro-darwin-x64.tar.gz"
      sha256 "eea8c0bb76092e8043c5b4e52930e455ab570a705cc1fb49bb8d6099ed29e60a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archastro-linux-arm64.tar.gz"
      sha256 "ee49ed82daa67491c2cfed0fd3e41b4a5aa4b3f65b29c041008cd0ecc08dd209"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.25.1/archastro-linux-x64.tar.gz"
      sha256 "d69c3259e548135b783644c5394ff0d1854b6bf1bc8972352885121181e5f262"
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

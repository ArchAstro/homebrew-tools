class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.52.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archastro-darwin-arm64.tar.gz"
      sha256 "889367619a282a131c96582a501a26cea7c30b94552ca1a2fd16ed1ba1e77b3e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archastro-darwin-x64.tar.gz"
      sha256 "ee213d8cfcdde31a1b3f421be7cabb7a8e463dedf9da0a68a48d25a9e465defc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archastro-linux-arm64.tar.gz"
      sha256 "35798c447c655e15f993a9f975af7ab011fc981e27bef4c592339b303d732171"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.52.0/archastro-linux-x64.tar.gz"
      sha256 "d97363a8b5ac60e8ba4492651a5f02beb8e2f4a321fbaa8bfd951eb1f381a3fc"
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

class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.13.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archastro-darwin-arm64.tar.gz"
      sha256 "8237dea94fa34c4f85f0d176939bf19120431f3ef18b3e19f513d14a9da6891c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archastro-darwin-x64.tar.gz"
      sha256 "273b05cc937b6cfb7e3fda47692183617b373e8dcd619534ddc4684e94de07d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archastro-linux-arm64.tar.gz"
      sha256 "f1ba870953504f4560b70897ac809b0c5619ae62976441ecc1b94f83b037b324"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.13.0/archastro-linux-x64.tar.gz"
      sha256 "9ffdf8e339f17140cb75d8025033ca536f5b333646d0f9f92a432387f99f4e87"
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

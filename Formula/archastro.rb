class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.46.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archastro-darwin-arm64.tar.gz"
      sha256 "19a88b2ac40dd660dc71249b5c7d1c4b5dad7f2b248cd6364e583ca4b3d73e78"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archastro-darwin-x64.tar.gz"
      sha256 "a33aa0f7a0c7b50997941982b198f81d4cd1f8f19ccc702da5343c705abcf9d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archastro-linux-arm64.tar.gz"
      sha256 "a41f6b7774f474c31a1fffe2c073afa5fa7976c98512e621626ee93647e0e972"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.46.2/archastro-linux-x64.tar.gz"
      sha256 "3ab72ebcf8fa5d383ef9094f707b2f050f100549a50d7c10565bc9c23d365cf2"
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

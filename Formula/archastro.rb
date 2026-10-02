class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.61.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archastro-darwin-arm64.tar.gz"
      sha256 "7119021ea70b44d385558e2e9a9aeb03e9a1813a0ff8dc0895dd1dfe739c7da7"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archastro-darwin-x64.tar.gz"
      sha256 "1f7cf6eccea53f4f3f054af78935b7e11b7301d23aa94522cf0f42119dd2b82b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archastro-linux-arm64.tar.gz"
      sha256 "cece1e6f9a1c4e43c29e80b7e882c5887f821ca113fca0e77c9f6a2258ee1eab"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.61.1/archastro-linux-x64.tar.gz"
      sha256 "c60c717393fcdc910682a87126a7496ed164885e92f1e01665eb5c8538624e7c"
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

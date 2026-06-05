class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.36.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archastro-darwin-arm64.tar.gz"
      sha256 "37af40f1b6460370da44efd53ec2ebab89bb276136e4ecc3a3d678b1215d8180"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archastro-darwin-x64.tar.gz"
      sha256 "3f5c3f5c27da51ef1b8eb5d327b1935b4f2f8189f0138e003f6ddc3f0092be14"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archastro-linux-arm64.tar.gz"
      sha256 "03ecf77edf1d2086ed3ef22a8d9817666ba91daae8fda1bf0463ddadc6859aa1"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.36.0/archastro-linux-x64.tar.gz"
      sha256 "2a1c3fbe734a36770dd15c54f2ac299318f3b3e88c9b6ba76847b98319704ba9"
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

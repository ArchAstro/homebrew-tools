class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.54.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archastro-darwin-arm64.tar.gz"
      sha256 "e2bc3e7bd420d1c3e51f0b7b6ac4cf69f61b1f465c62d063379f3060863c01c3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archastro-darwin-x64.tar.gz"
      sha256 "3aaeb336ce8362d08d89cefa3ac6266e3bad7623999df065258cc0fe645e1fbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archastro-linux-arm64.tar.gz"
      sha256 "00f90ba87d361c2261f6231f01f2c4ed999d1ebe23d5400b884eceece76a4223"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.54.0/archastro-linux-x64.tar.gz"
      sha256 "6e1d68d33008c12abcc4a967aebc7884f9b2fdc1fbcd83a22515623e99b827ef"
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

class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.47.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archastro-darwin-arm64.tar.gz"
      sha256 "c417a8e983513dba5cf98d297a33531fd0b3dfaf33237952729fb0b553047e72"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archastro-darwin-x64.tar.gz"
      sha256 "d8abb22bdc2245583d90965dcf71df24a947d81e810c862178b2b6628f635871"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archastro-linux-arm64.tar.gz"
      sha256 "e66f92cc68b644efab73d355f947343cb3a32a89a4a7fe683d93bbe38c17e38b"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.1/archastro-linux-x64.tar.gz"
      sha256 "a9eac745ab9f31385f2a7f5405d7fcc39beb9084cfe0709dc6e92a5793a74804"
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

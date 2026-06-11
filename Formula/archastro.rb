class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.37.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archastro-darwin-arm64.tar.gz"
      sha256 "ca922d77352b7ada26f025cfc8407671ec4e827263123b1374844193fb9b86e3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archastro-darwin-x64.tar.gz"
      sha256 "58dc8727242f3bd023e14ad6c0245270dcd205442e15b8dc40957d27fbbea313"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archastro-linux-arm64.tar.gz"
      sha256 "d2ee1c393c233bff5bdce56a339b45940c891aa4e7f6b5cd7dbb3a4db871401c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.37.0/archastro-linux-x64.tar.gz"
      sha256 "508f0bb4ec54054f7814b256a4c15141bcaba2a009d17d7d4cd78ebf0f6d4fc0"
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

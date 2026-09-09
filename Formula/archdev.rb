class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.35.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.5/archdev-darwin-arm64.tar.gz"
      sha256 "06dd4d19e51159bcbaaffdee056338276da92bd79a5595bf44f0e4bd0a6e4782"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.5/archdev-darwin-x64.tar.gz"
      sha256 "b1bd763defcb82adf155ecbb8d52ddfac86faa08094857b3ce91b290335be005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.5/archdev-linux-arm64.tar.gz"
      sha256 "414071a2f44c4d0a2a8459e5df8e69d7a4cc07d61c26010296a9381a808bfc22"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.5/archdev-linux-x64.tar.gz"
      sha256 "38bca11d05c5cf3c763470f6efb8d42b33b604e6214a3a3be9911c6e248f724d"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

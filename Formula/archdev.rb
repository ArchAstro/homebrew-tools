class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.43.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.0/archdev-darwin-arm64.tar.gz"
      sha256 "2793e457a2a877f3f1bcc068602d8092ef4c3fd79e03066f01751ca89c3aabe8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.0/archdev-darwin-x64.tar.gz"
      sha256 "6ac20c5cdffa55f3e4fb7dafab761c50aea42838a3a1aa878bf92e3d7e4b16d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.0/archdev-linux-arm64.tar.gz"
      sha256 "7a1a031017b175e73512d398c9ad6611164eda309bcb9a99fab611ba6825a4b4"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.43.0/archdev-linux-x64.tar.gz"
      sha256 "6396ec0ee43d9c845987e9e9879a12554e82f2e8d8b86545f4f46c4aaa9343ea"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.7"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.7/archdev-darwin-arm64.tar.gz"
      sha256 "92888a70fdc7df43f7ccfaee532a3ea0056b6d9da38ba6c7ce83a638bf389dff"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.7/archdev-darwin-x64.tar.gz"
      sha256 "ec1aabe7476e04fe5d9c76c204bc3943b7a094869e35c147173f2256974b4967"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.7/archdev-linux-arm64.tar.gz"
      sha256 "31c3b120a8f68d630d6ebd3b355cc54329107c97eddbcb0988e8f4eaca27f116"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.7/archdev-linux-x64.tar.gz"
      sha256 "24ef5d8e5eb788ef7854268aad604e33c09a248febcb48d28bb6bdc49c6283ac"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

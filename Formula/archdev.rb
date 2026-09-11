class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.38.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.0/archdev-darwin-arm64.tar.gz"
      sha256 "b7c56edc326f2d43e7b92ecacb60f1ea355eab564e5fb47f189af84022b33717"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.0/archdev-darwin-x64.tar.gz"
      sha256 "85a8eaf5f3f693ad799e047fdac6e04596a5c798405b1675ce8914a11b67c36e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.0/archdev-linux-arm64.tar.gz"
      sha256 "ffdc44dd738e800c2807d28adcec20f97f172789405d8d7ea0c3eebcfc5796a8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.38.0/archdev-linux-x64.tar.gz"
      sha256 "7d105e857e994acd4d8a6b225adfe9fecf1e88faca4dd8114a498b7cf1b5f4ed"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

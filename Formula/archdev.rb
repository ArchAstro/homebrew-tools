class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.5/archdev-darwin-arm64.tar.gz"
      sha256 "9b68be08846e86d367e19d522c9eb54199ff0f723490bd6e500e5bc1fe13757c"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.5/archdev-darwin-x64.tar.gz"
      sha256 "d4ad4dc9031ed08fdb157eb79bd812149af334d94c00f295d95766763dc7a155"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.5/archdev-linux-arm64.tar.gz"
      sha256 "65101ca00ca99fee6ff4bf9e7332f0d585c0e0d3e94c9b098d6b45034a23c719"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.5/archdev-linux-x64.tar.gz"
      sha256 "874910c1341e0afcb3f8bc2c34d3fd955bfb57d625596dc5d74c84b766296e06"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

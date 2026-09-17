class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.6"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.6/archdev-darwin-arm64.tar.gz"
      sha256 "0807b48b8de955a8ae741f26139d8c7cfe36457d78a9aa8df3345c6341186c42"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.6/archdev-darwin-x64.tar.gz"
      sha256 "28131a4ca4b4d888992613ade686dc80fd2fe9c1a8619ee178282b7cfd7e5b16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.6/archdev-linux-arm64.tar.gz"
      sha256 "24d824327f2223e451608e156aa12718e8880b11e945ee9fb3f1abf410705ded"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.6/archdev-linux-x64.tar.gz"
      sha256 "fa81b6da6d43c68078a42251730b0dfc39842726b33960096836784f3890f745"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

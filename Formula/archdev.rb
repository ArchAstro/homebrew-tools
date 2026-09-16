class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.4/archdev-darwin-arm64.tar.gz"
      sha256 "a8a025914346de864a5e7842bd928418a00bc94cb68a01f5affd84cc09bee4c3"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.4/archdev-darwin-x64.tar.gz"
      sha256 "ba87280f82b72a61f01b81541322abbafff012c4a8c928dc5de6bc567d66789e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.4/archdev-linux-arm64.tar.gz"
      sha256 "d9eb3f77738c0d78af3eb11178027fd7ba9e31b833c877e60843ca7edbf2464d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.4/archdev-linux-x64.tar.gz"
      sha256 "8f751a02c1858191ca8880291fd49617c41b9a5d6e300189efd982d54acfb4c7"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.42.10"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.10/archdev-darwin-arm64.tar.gz"
      sha256 "0f38893952ab40531304f1bff046721d6a3a88fa3a4d383181d6187df148e653"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.10/archdev-darwin-x64.tar.gz"
      sha256 "8e766c90c359e1b1ab03bdce39238f70a7195433e1d276bfc1bc563217c0fb33"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.10/archdev-linux-arm64.tar.gz"
      sha256 "cf3fa05d5220243e78db15cf64a98d85c9c975978ac9e4664c4a123f459830eb"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.42.10/archdev-linux-x64.tar.gz"
      sha256 "7d5f32cd810f4bab0270a8ac40ca43ca4e8e9128e56ca6564d15f13f8cc6ea37"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

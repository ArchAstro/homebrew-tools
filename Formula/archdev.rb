class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.4"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.4/archdev-darwin-arm64.tar.gz"
      sha256 "689626324228dd6cca374a134fd99e1b216000c11623df7e435414f27205dd12"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.4/archdev-darwin-x64.tar.gz"
      sha256 "c79ba1e9c03ab1b1c2861a8b17469aaebada8ff8c696d2122b99a507b3521401"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.4/archdev-linux-arm64.tar.gz"
      sha256 "30e380a0197b6becac46027b4d19450510937e66ffa86a2475fd077a9424802e"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.4/archdev-linux-x64.tar.gz"
      sha256 "de5d9d7ef72651e669ad1b390999990fc92da10d9d28b58948113556eaa3488b"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

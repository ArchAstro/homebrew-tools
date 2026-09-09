class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.35.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.2/archdev-darwin-arm64.tar.gz"
      sha256 "09385ad8e5f0e0af00cd2f632e461dddd76ed95287ce3ec953b91d9587aa587a"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.2/archdev-darwin-x64.tar.gz"
      sha256 "5c318b70aa1b35c3a30cf8df8820cfb11e2ba8056b1ad370f14c50512a1d370d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.2/archdev-linux-arm64.tar.gz"
      sha256 "65b0832a1444bd9a4ec0904592a5a4b129cec04d97e728bf1427e7dc2102ce15"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.35.2/archdev-linux-x64.tar.gz"
      sha256 "45ad73f688666413db9dd80f2fa1f3fc30ff9874763107702e2c8686c2171972"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

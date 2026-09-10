class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.36.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.36.0/archdev-darwin-arm64.tar.gz"
      sha256 "8f91675245880441fbc413800461427869ad3a5d0bf59a4b0aec85e09a6c64eb"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.36.0/archdev-darwin-x64.tar.gz"
      sha256 "011587dd0a7c32c0984db37667d7075101309bc04099a614826cc796006e31b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.36.0/archdev-linux-arm64.tar.gz"
      sha256 "9ba10aebd64fbbb52fe75c593cf501b7cd63882fa4cde86e050e0f7269aa2a62"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.36.0/archdev-linux-x64.tar.gz"
      sha256 "397ff06b2cb3d0f8e5b8a23bfe5fb5772e022b312c889b1b01a5b022ceed0262"
    end
  end

  def install
    bin.install "archdev"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

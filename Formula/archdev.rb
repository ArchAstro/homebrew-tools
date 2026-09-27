class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.11"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.11/archdev-darwin-arm64.tar.gz"
      sha256 "7f8d678bd39b3cf902ab7acbec234addd331997e20cb9beaeb228a187ab7fa8d"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.11/archdev-darwin-x64.tar.gz"
      sha256 "2e610f97cd5d69d40a26eb5fbfafebbe14216846d274b1e397f67435f193de8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.11/archdev-linux-arm64.tar.gz"
      sha256 "4e63cfeb56070eb725ed6e5b73334df26c3c20101498b7273f968f5c8ee51421"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.11/archdev-linux-x64.tar.gz"
      sha256 "cecda820b67a644b648559a70338d556734abcce02dbdb56e6cb1466b79655ca"
    end
  end

  def install
    bin.install "archdev"
  end

  def caveats
    <<~CAVEATS
      Run `archdev daemon uninstall` before `brew uninstall archdev` to stop
      the local daemon and remove its service. If you skip it, the daemon
      unregisters itself within about ten minutes of the binary being removed.
    CAVEATS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/archdev --version").strip
  end
end

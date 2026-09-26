class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.9"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.9/archdev-darwin-arm64.tar.gz"
      sha256 "efeaf6d14978849222215d3e28fa9226ff7dcc7079d690c6a491e5609854a35f"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.9/archdev-darwin-x64.tar.gz"
      sha256 "59a34b369c53fa9153ead032a8084268e0ee5947c2c0834eef310dbf24c38a75"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.9/archdev-linux-arm64.tar.gz"
      sha256 "62d65dc94adc20a83185520672e3ab27b1890b1a2298794ccf48b6c97942ee27"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.9/archdev-linux-x64.tar.gz"
      sha256 "5fb7f539bc39d47cb69595307015c18acc61fb082d3201c100f39d407223a6fc"
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

class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.48.7"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.7/archdev-darwin-arm64.tar.gz"
      sha256 "8c72abb4b274a9e5103fcb7155e609992e1cc13dc2cf8cbe4d0d8bedd1d77788"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.7/archdev-darwin-x64.tar.gz"
      sha256 "a3531a44e74e8228755dd093c50fc80c4f32e68d3502b581ca627a6b70bbf5bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.7/archdev-linux-arm64.tar.gz"
      sha256 "433b6dfe262847d96808cb27b832d831b5436f03a868b2619082014db33e6402"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.48.7/archdev-linux-x64.tar.gz"
      sha256 "acf7c674ee2de9dc03ca1c9ea97ba3489521e2895d7abf38ca3caf13f30a1332"
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

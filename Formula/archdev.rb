class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.45.9"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.9/archdev-darwin-arm64.tar.gz"
      sha256 "37c7ba376f3da23e873970467d9dc4b35660c6ee2ebde8785df154d83c25c9f7"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.9/archdev-darwin-x64.tar.gz"
      sha256 "ef9ef786abd15ecbd6d56921a547d2a65c5601e7a82cc14ef96e56dd0d377325"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.9/archdev-linux-arm64.tar.gz"
      sha256 "708c72c5ce165f20e2fe7a26d9e089027f2db1edbf6cfaa6f82fca29afe510dc"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.45.9/archdev-linux-x64.tar.gz"
      sha256 "bfd3ba89f3eb5bcc12bf0d86fcb4ad67915ebabc5d193d00ec97958106c6db83"
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

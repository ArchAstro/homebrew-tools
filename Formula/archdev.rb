class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.2"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.2/archdev-darwin-arm64.tar.gz"
      sha256 "b65acea7f414fb35cec9ea07f4e69c74b11a6bdca4e55975514e0e56f8b6ff23"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.2/archdev-darwin-x64.tar.gz"
      sha256 "9f231c19d01e03e79ba776f74e3965c40e68fcc31c059e6de8a02a23be0af83a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.2/archdev-linux-arm64.tar.gz"
      sha256 "7bd1d0297c96da7660c5df22985a5549bb9e6f9600359ab90bab34303adb7665"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.2/archdev-linux-x64.tar.gz"
      sha256 "6fc012af239c7b545727f3a71e3b7f3ba96b82b5bbd6ec5f68b2d99c568312e9"
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

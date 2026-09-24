class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.0"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.0/archdev-darwin-arm64.tar.gz"
      sha256 "78754919379644b8af568cf4275fc9d48f7e16ca891f817634a12cf6dea7b8db"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.0/archdev-darwin-x64.tar.gz"
      sha256 "aa7cee418afa6f2206fe2896106ae46a8ab377198a670d1a51cf56d81310c55f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.0/archdev-linux-arm64.tar.gz"
      sha256 "381bdfe26aec32e41ab547334846c7c31e08660854fea89ef1335fdd05b21404"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.0/archdev-linux-x64.tar.gz"
      sha256 "8b69a4bbfd97f1b6bc0f562b1501d0aaa4acb41968b7823809605eef0c4cc230"
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

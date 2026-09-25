class Archdev < Formula
  desc "CLI for building and running with ArchDev"
  homepage "https://github.com/ArchAstro/archdev"
  version "0.46.5"
  license :cannot_represent

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.5/archdev-darwin-arm64.tar.gz"
      sha256 "ef5d891c3a3bc91d5ad4b0f0faed0392bf68956b369e1d159869e08037be69c8"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.5/archdev-darwin-x64.tar.gz"
      sha256 "9627412e9732bd7bd683e8c8663a2062a7ea17626be613df7d7a1952af74e4f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.5/archdev-linux-arm64.tar.gz"
      sha256 "1e591ef74c29232bffd897bdb06b9a5a841b5890dfa7eb126953c3287e267ddb"
    end
    on_intel do
      url "https://github.com/ArchAstro/archdev/releases/download/v0.46.5/archdev-linux-x64.tar.gz"
      sha256 "fadba0286c238598880938842d653fdcaa6cd8933538d0e51524a74b059bae93"
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

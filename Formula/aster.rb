class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.31.4"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.4/aster-darwin-arm64.tar.gz"
      sha256 "5ed113fcc3d33fd485b9e89a161391ac6098a5e8c8afcc16d4f6c36054ae7c31"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.4/aster-darwin-x64.tar.gz"
      sha256 "501dc93159516ad43e55d4121d9b59cad9da31ad649d6116a99041fecd79598c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.4/aster-linux-x64.tar.gz"
      sha256 "cde0faef9cff94a2682c70d5b803336100e143f43c68f6e95227ae092c5c1c33"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

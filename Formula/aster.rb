class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.28.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.28.1/aster-darwin-arm64.tar.gz"
      sha256 "156b9af928cd3741efec0a0a3de46a634f6ba4de46cffd5fd734485969fb39bb"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.28.1/aster-darwin-x64.tar.gz"
      sha256 "f7a30ddf987e94fd49caa45e2eaeb9aaca101962224750233337c5680881d125"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.28.1/aster-linux-x64.tar.gz"
      sha256 "b18cdafdf531919aec9b517f36ac08f45e2f92bc7a737781a25eb68d32a44fc8"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.31.3"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.3/aster-darwin-arm64.tar.gz"
      sha256 "ce98f830cc7e757b01ada714ab7a09ae30a28176b780c8ec1c415d989a3c0a50"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.3/aster-darwin-x64.tar.gz"
      sha256 "0ed6393984bec7eb8384c77ff419954d41afb21259f9b0e0dc34790bb0bc6588"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.31.3/aster-linux-x64.tar.gz"
      sha256 "2f59e05541b7d7a97b33450915ae4f6eb70043cc8866603f079c48883dc912a2"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

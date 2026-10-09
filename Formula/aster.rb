class Aster < Formula
  desc "Build orchestration for polyglot monorepos"
  homepage "https://github.com/ArchAstro/aster"
  version "0.17.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.0/aster-darwin-arm64.tar.gz"
      sha256 "8ab665a86f4e8ad6b0b3eae6ef112a34a52eb406388543a7557e37cddaddd839"
    end
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.0/aster-darwin-x64.tar.gz"
      sha256 "7c79a77f6dae29e7f8327491e01d3c30abedfc44422d301cd5c48a1a9e98642b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/aster/releases/download/v0.17.0/aster-linux-x64.tar.gz"
      sha256 "0b7aa7d91a33441c3126919dbaaf30c321ca0cf45409fd1d95cab32f661f71d7"
    end
  end

  def install
    bin.install "aster"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aster --version")
  end
end

class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.1.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.1/scopey-darwin-arm64.tar.gz"
      sha256 "92d8c146b1aa1da1ef21307d04f1bd9632ec725e7eae9fd9554da486356e02dd"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.1/scopey-darwin-x64.tar.gz"
      sha256 "8a7c0222c10a1bd6b4cc2e69678e32179775c8ff925253780e6b7a0860e1018d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.1/scopey-linux-arm64.tar.gz"
      sha256 "a311e18466ee7e672a6f7e89ff24ac2c8d61bbce760057d03a10b920f0c3b81d"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.1/scopey-linux-x64.tar.gz"
      sha256 "14fc70da30189fb904fa608c52bd27873384c771073bad8ea174d38425afc943"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

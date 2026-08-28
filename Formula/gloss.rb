class Gloss < Formula
  desc "Attach durable intent annotations to source edit hunks"
  homepage "https://github.com/ArchAstro/gloss"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/gloss/releases/download/v0.1.0/gloss-darwin-arm64.tar.gz"
      sha256 "b878bc3ac8525db87736fcfd57f3a4ee2b518dc4b5eab298466a177ba06dc353"
    end
    on_intel do
      url "https://github.com/ArchAstro/gloss/releases/download/v0.1.0/gloss-darwin-x64.tar.gz"
      sha256 "278395aecd7d33bdc7569045ea61dda73fe550926328630d032cdfa1f77b8122"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ArchAstro/gloss/releases/download/v0.1.0/gloss-linux-x64.tar.gz"
      sha256 "990d62df0e668889d4c88a175dce7b54ca09c62bee322dd5dae28937e8a15ed4"
    end
  end

  def install
    bin.install "gloss"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gloss --version")
  end
end

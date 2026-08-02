class Scopey < Formula
  desc "Keep coding-agent sessions aligned with the current scope"
  homepage "https://github.com/ArchAstro/scopey"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.2/scopey-darwin-arm64.tar.gz"
      sha256 "3297847afe7cd5ea9bdc994a050288cac15a19323c0a81b096a4f1380eae5628"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.2/scopey-darwin-x64.tar.gz"
      sha256 "1ee154d06020f0af0cb6fc51f19a81ebd53ddb01a6f38abe6061542cccc8b415"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.2/scopey-linux-arm64.tar.gz"
      sha256 "4d4daf7119d678425e6ac4bc201d58ada8968cf0eac2f73165d25370c49f4f69"
    end

    on_intel do
      url "https://github.com/ArchAstro/scopey/releases/download/v0.1.2/scopey-linux-x64.tar.gz"
      sha256 "28bf7ca99bb9427b6b468efb5a288152eadf27eab7611786c74413b5a95a6fc1"
    end
  end

  def install
    bin.install "scopey"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scopey --version")
  end
end

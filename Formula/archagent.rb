class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.35.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archagent-darwin-arm64.tar.gz"
      sha256 "30ecee2a2088f4928d5c0138a91bf58f5f76c62c4d004293c15763b5a18f87f3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archagent-darwin-x64.tar.gz"
      sha256 "71671aa7178bf0435cf612260db827b6e257332ee1bccda1db223bac7617a2ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archagent-linux-arm64.tar.gz"
      sha256 "0c8cee628e17060ff269b4a5934e40a41b94ae4d2fd489837b610d46c9cfff51"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.35.0/archagent-linux-x64.tar.gz"
      sha256 "3bbd84912e1988a50935dbc3ae36b64839c32a8861ae764e4a79b4cc370e3521"
    end
  end

  def install
    bin.install "archagent"
    generate_completions_from_executable(bin/"archagent", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archagent --version")
  end
end

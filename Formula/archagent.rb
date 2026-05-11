class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.32.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archagent-darwin-arm64.tar.gz"
      sha256 "ec56f492f4f962cde431690dd227a7cfaaa13412596566d7a1fc1d4ab104e901"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archagent-darwin-x64.tar.gz"
      sha256 "d8e5b6c1d0ab4a8113c7c77bbd611f9f2a88bc9308a191d9e0d1ff06f4f84677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archagent-linux-arm64.tar.gz"
      sha256 "a417f9ed0ba019de551f3f631bd44892afa26a197377ce3ef6dde2dad468f823"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.32.0/archagent-linux-x64.tar.gz"
      sha256 "77f27951c20c0789dddd62073f0aaf17167a44250a1bd426d6408073892909ca"
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

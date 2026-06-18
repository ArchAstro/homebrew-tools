class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.42.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archagent-darwin-arm64.tar.gz"
      sha256 "956397b6363e1fd6d402ed494f1d299a24abd5339c0ba51033a45f783a1bc871"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archagent-darwin-x64.tar.gz"
      sha256 "10169558a0640207322b67ff237ab699d4aa1cdc6a342983cedc64d481c831f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archagent-linux-arm64.tar.gz"
      sha256 "9075bb507ac4959eb7b409f1fab4e2e8a50e1db60aab7ddf1647934da7757731"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.42.0/archagent-linux-x64.tar.gz"
      sha256 "2d5ccb03bb710d5dba348b2b9ab386367f79e24db02f33dd2fa32bd5d8f12c3e"
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

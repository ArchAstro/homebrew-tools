class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.16.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archagent-darwin-arm64.tar.gz"
      sha256 "f88629b303fde25faae97cc6790984cdad51bf2bcb74e2f4176f00eff31070e5"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archagent-darwin-x64.tar.gz"
      sha256 "c2908d33151512f03399473dc98c07b8fb0862836b8746db93abee4d8c6a94bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archagent-linux-arm64.tar.gz"
      sha256 "4dbd6890be6f9269b29be509c71b08454f13a4005ccb4447faf77190e0ec5ec7"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archagent-linux-x64.tar.gz"
      sha256 "40eb269611234a7a22bd19755617c7ef4952375ddb4609b563768fa50002b1ae"
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

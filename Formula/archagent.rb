class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.55.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archagent-darwin-arm64.tar.gz"
      sha256 "f25ddc9c6d2ef5a396bc44447e17cf972c4a79713e88a0ead0972dae2384974e"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archagent-darwin-x64.tar.gz"
      sha256 "523bc2daaa718169184463f491b1b38ab5e6defcac4deb1febf1fdef54cd539e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archagent-linux-arm64.tar.gz"
      sha256 "16a5f494408cc7b6e48f3cce754407f1e9e04cc8ae2e1c520bf58a46009c93c3"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.55.1/archagent-linux-x64.tar.gz"
      sha256 "76999efe2cf2ffe3c213638b273b7fde6811628b82e085bfb410d1dff0228558"
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

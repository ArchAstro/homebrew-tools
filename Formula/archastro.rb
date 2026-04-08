class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.16.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archastro-darwin-arm64.tar.gz"
      sha256 "189bcabb393ffc9ece7905d9a1c00a3cb2f7392853088383a9ba47d12f2de77d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archastro-darwin-x64.tar.gz"
      sha256 "4a2dcbe0597a9729f23370f749c87a7ee5dc939443db99f47bea7893df1f3728"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archastro-linux-arm64.tar.gz"
      sha256 "1d56e033ab8a9af413222585f726634483f2c4ad9a690bfd50705a8622d78fe4"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.16.0/archastro-linux-x64.tar.gz"
      sha256 "93b785907e3e7d29cc702b896f0fc36a4a0528bac0f69882c907a44b80c5e084"
    end
  end

  def install
    bin.install "archastro"
    generate_completions_from_executable(bin/"archastro", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/archastro --version")
  end
end

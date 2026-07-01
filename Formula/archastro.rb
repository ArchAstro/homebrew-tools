class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.47.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archastro-darwin-arm64.tar.gz"
      sha256 "43649e41ce446b7c8b524a5c3e4885ea59731b34bcf3e03517498907651521ad"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archastro-darwin-x64.tar.gz"
      sha256 "503bc0b4fc2680fcf0d3f271e6b2338e723e3ccd5e66cf58d72945e0530393f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archastro-linux-arm64.tar.gz"
      sha256 "77f91a7632234a542b496570c44dc70b7a794fa87ac60e32ec282a2df6dc71ba"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.47.0/archastro-linux-x64.tar.gz"
      sha256 "5c9d1d8586f8f5b92268357938a959a884db439644afbe576158fb7de7f102dd"
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

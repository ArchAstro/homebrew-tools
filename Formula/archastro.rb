class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.20.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archastro-darwin-arm64.tar.gz"
      sha256 "00f6c1b4d86895e5a661580cb1674042899e04322ff66d491c27c429ad1c824d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archastro-darwin-x64.tar.gz"
      sha256 "b93a1dd6e74faad23d7f6876ca1ffb590cede9393020cfa34311c51e9e66ce35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archastro-linux-arm64.tar.gz"
      sha256 "812eaf10b5d876e0525b3262890db6c33ecaffb3457f759f83d2f9fac6c695fb"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.20.0/archastro-linux-x64.tar.gz"
      sha256 "cc3a1748df5959f330c5e8052270bb6c0eab9cfc990599facd2beda5b6342d1a"
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

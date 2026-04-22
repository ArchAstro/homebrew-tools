class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.26.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archastro-darwin-arm64.tar.gz"
      sha256 "dcc1caee3c3ef24b6e894b2ab9197c2df792ed825ad25f816d9ea8a41572ae84"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archastro-darwin-x64.tar.gz"
      sha256 "3eff68b94e40fa1d67f93aa60e7ddd8dcefc3a6cbe29318225954d0a26e2eb3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archastro-linux-arm64.tar.gz"
      sha256 "28d345e630cb932b930df873ff2cacccccf27384c5a39b2e2ae0af609d7c600c"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.26.0/archastro-linux-x64.tar.gz"
      sha256 "cd4f026e41a36fef31ac1c460f207c6865b722282efbcf8421881647c231a801"
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

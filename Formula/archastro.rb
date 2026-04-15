class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.21.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archastro-darwin-arm64.tar.gz"
      sha256 "fa24dee4fc09e2df4dc647cbb1ca16c77568f1a6b5cd787067073804fc053313"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archastro-darwin-x64.tar.gz"
      sha256 "1fe85a898bc28342c41976dcd5bf6852943667ca6043cb47c0969298e5a144e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archastro-linux-arm64.tar.gz"
      sha256 "b92d4ef47658d054e616b9d5adedf03927f88577a942edf74e4875dbfd9b9334"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.21.0/archastro-linux-x64.tar.gz"
      sha256 "f10f57e7e1c6eb7497d8029dd2c32f23be7e725a15fc324de15bfb8567e71a65"
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

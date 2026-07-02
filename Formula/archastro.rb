class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.48.1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archastro-darwin-arm64.tar.gz"
      sha256 "fa555c20a2578a56e2ed0141d0f3e7c24aa90ab9b612480963186f73e5b17525"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archastro-darwin-x64.tar.gz"
      sha256 "393f3e7cbb18fe43a3395925620e7c00ae45389a6789fe0bac1d2921d0e26a90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archastro-linux-arm64.tar.gz"
      sha256 "a518170a98fc9e4be75b22e5b0727c647b7e27d4771455c22fc5c09e32f6dd2d"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.48.1/archastro-linux-x64.tar.gz"
      sha256 "3e0f9d13b1555a7bf87744a7cbbc6bb49815c34f7cf6cc308deb419bf0b38beb"
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

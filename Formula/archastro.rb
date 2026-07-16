class Archastro < Formula
  desc "ArchAstro developer platform CLI"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.53.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archastro-darwin-arm64.tar.gz"
      sha256 "067638d0655edfdc5c0de85ecfdf1807b98e1b6c9d7ad4de9111460ffa293014"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archastro-darwin-x64.tar.gz"
      sha256 "9caa5cf19f41a9e3215f51872b99bdc7c3d8064b51583c40983801e6720c8484"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archastro-linux-arm64.tar.gz"
      sha256 "e3d5957cce7b0247db33057697743d1c9ed102f7ed3e9cb96c95505140d4c1d9"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.53.0/archastro-linux-x64.tar.gz"
      sha256 "c8d3c4dae1e1ac45e6e9e6528d77ab9dbcfc817413eefa11d9cb4c8a7d1e164e"
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

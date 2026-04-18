class Archagent < Formula
  desc "ArchAstro agent platform CLI (org mode)"
  homepage "https://github.com/ArchAstro/archastro-cli"
  version "0.24.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archagent-darwin-arm64.tar.gz"
      sha256 "7c1d9039077e7be78c3b4678a78bce73b4dc6b12d1edade5c395cadad172f660"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archagent-darwin-x64.tar.gz"
      sha256 "4622fcb606d9c21df097dba1abcea842f649ad0311bdf9159fe9158dc859705f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archagent-linux-arm64.tar.gz"
      sha256 "25b5e76a29fb83849b56d42e4c18b8d640f13143fd1722a67df0ee39f5b48eb8"
    end

    on_intel do
      url "https://github.com/ArchAstro/archastro-cli/releases/download/v0.24.0/archagent-linux-x64.tar.gz"
      sha256 "83d97b380c7fe37349e6bc45975bc6721f21e2f7cc1ef782b7d4a80740a06162"
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

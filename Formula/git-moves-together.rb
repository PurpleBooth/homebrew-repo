class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.5.64.tar.gz"
  sha256 "95e83657eb32b9bba9921ebd375a199fa7a3a0f48d325a34b1db2de7217d126e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.64"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "022421f11eadea0e6fd120039d0b10ad8565252881663b22eb8f5971616a18ce"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"
  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "git", "clone", "https://github.com/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end

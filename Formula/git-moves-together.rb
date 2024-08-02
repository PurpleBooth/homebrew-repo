class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.5.63.tar.gz"
  sha256 "62b7274dc78d4668a455c1e769a58275b4869de42f16472eb1c222f8c90ca612"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.55"
    sha256 cellar: :any, monterey: "d67921fa4daf42d9967b9145c8343813d403290b51b195d60f79cf1646c2222c"
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

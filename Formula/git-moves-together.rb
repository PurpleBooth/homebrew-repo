class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v1.1.0.tar.gz"
  sha256 "96a5967dcdb742045a63bdfe36e0c8d02bc511816ab73293b4b8c7967390531b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-1.1.0"
    sha256 cellar: :any,                 catalina:     "4097513b3e8cceccd0e1ef7fdb726dc018bfb84b860813095c69b55c0b3b1cbc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "92fa8cd5aefb77c3f19af7ffb837a727606165faf470b9824a98cb103c515dbc"
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

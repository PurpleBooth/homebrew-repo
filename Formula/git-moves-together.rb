class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.23.tar.gz"
  sha256 "c50406af77ed12367d44991436e146e3c175e904e95c4e03893c8e8677a91c44"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.23"
    sha256 cellar: :any,                 big_sur:      "75da4f9c66abc75b5b4156e61922242f4da5b79c838facc1e1d2ba7c6a05d9e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "50bbcc520c940b6a12ee1d792dd4fa4f358fbbbc54727783b072c9411f2b4730"
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

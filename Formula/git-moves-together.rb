class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.24.tar.gz"
  sha256 "e0ea224f9a7f884b197656e3965d4348d62e027a2cbcd73a52d813ef178b6637"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.24"
    sha256 cellar: :any,                 big_sur:      "638bd1d02384d135d590b294e80fccb6317a3c1243485654ab2a36af9e891c77"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "01590c97638179a647c2a542a5d2aa70253cd0d8171ad421587c7707d61d94bd"
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

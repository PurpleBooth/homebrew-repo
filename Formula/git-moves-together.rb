class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://codeberg.org/PurpleBooth/git-moves-together"
  url "https://codeberg.org/PurpleBooth/git-moves-together/archive/main.tar.gz"
  version "2.8.2"
  sha256 "cc9a62a866e7c0f42208d09c863158a791bf1d28668fd82136ffdb4d810dd1b3"

  depends_on "rust" => :build
  depends_on "openssl@3"
  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "git", "clone", "https://codeberg.org/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end

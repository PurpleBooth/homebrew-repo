class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://codeberg.org/PurpleBooth/git-moves-together"
  url "https://codeberg.org/PurpleBooth/git-moves-together/archive/main.tar.gz"
  version "2.8.0"
  sha256 "15423fdc66f5d01ed91c51b2d5d1d0ebe744ff95f14270c6344da25b8b7fbb5b"

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

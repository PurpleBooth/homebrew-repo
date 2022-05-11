class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.39.tar.gz"
  sha256 "e9d6d91cb3ebbd787157b0040692fed6afff42908f45868de423d651e9f191ef"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.39"
    sha256 cellar: :any,                 big_sur:      "4cad97f029db9ac9df4913c9ed5a60eeaf9a4edab3b963ff14adbb169678baba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "67dee12f915672c7c88978b9b98a49ceb4331b02a4d71c1fd2f5b5e4ecdeb05a"
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

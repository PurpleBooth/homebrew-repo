class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.2.tar.gz"
  sha256 "85e7bd04a66089c97978ad3fd71848c6efb91d1062b0b9387d64721408c48ba6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.2"
    sha256 cellar: :any,                 catalina:     "10cd4421a256ee05d0504cc4981d5bac1d9fe203cfd6a53aafaf932eb41d15ce"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba1750a678897fe677c45055d1f3a7a86fcb60409b17d56129b8ae17d026ad40"
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

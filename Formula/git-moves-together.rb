class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.6.0.tar.gz"
  sha256 "4ba19151456fbeeedf109d9a153e43e4423e3b0f2ef05ee77df1be1d9dc202b3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.6.0"
    sha256 cellar: :any,                 arm64_sonoma: "b26318c3ba4c6af5347f53b3363cda40bfe34acabebf8ecd40b154bc1b5093b5"
    sha256 cellar: :any,                 ventura:      "e36a223d5266b88280ce7a9392499ae802d019e8163bc96281d89cdc9ec78a7b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "025eb1d4cfc6cffb8b2a5cfd03613a39a31f289c2013476fc0175793b004688c"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"
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

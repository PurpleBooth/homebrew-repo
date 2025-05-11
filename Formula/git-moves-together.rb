class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://codeberg.org/PurpleBooth/git-moves-together"
  url "https://codeberg.org/PurpleBooth/git-moves-together/archive/main.tar.gz"
  version "2.7.0"
  sha256 "018d70842ebc729036cc9b1aaba9769134e59d07460ec6ff9419d43f02c83cc6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.7.0"
    sha256 cellar: :any,                 arm64_sequoia: "c8d34ae141ffde3733e0aac7ba10e0e6a5f603e897a3e6b66839b92d49023e18"
    sha256 cellar: :any,                 ventura:       "fb62ffeb708e15470a241fd02c884bc49c37f80ffd760e1b2c32d721221707c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d2453366fa2cc8dce852863659e17754c4f4ec06a7db634f1d50792834311442"
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
    system "git", "clone", "https://codeberg.org/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end

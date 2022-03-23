class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.30.tar.gz"
  sha256 "775e04e2ab1597f67dc7f19a2024f95197b5249a22570c661adec1fe33c2b309"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.30"
    sha256 cellar: :any,                 big_sur:      "ed1c1a1be7330119bb0769fdb8d6728f8e25f31ccdd2daf11cacf71661138cfe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "31228025451b7a75eb445dc9bfbb25bd9ecf8099a685e0dd05ea94340f023ae2"
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

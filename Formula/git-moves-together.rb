class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.29.tar.gz"
  sha256 "5ee9687027eb1a0c3fd35bbc250fd234fadde5bb65ddfe74409ad39a73bc10ba"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.29"
    sha256 cellar: :any,                 big_sur:      "167ee6c520bae62115c4e838a2d301e724daa4f08466be9cc3693234d7c22f9b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "419c53ee98a87e6b47aeaae708d1faca604a4086fc7a35cec674e67e75d73765"
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

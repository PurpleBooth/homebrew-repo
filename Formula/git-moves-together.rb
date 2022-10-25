class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.43.tar.gz"
  sha256 "e6bd0b830a99b1fe5bc04e985db6581882a50a753dd79a1a3a3f2b80d20f9cbe"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.43"
    sha256 cellar: :any,                 big_sur:      "65165d90301defcb1dd253190a742e8cf03eb7c71986dd5262840cfad635b496"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ea2aa2e313b883ab844b8fb2aedfe896728cac74b3a7a5801d01894a22aac390"
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

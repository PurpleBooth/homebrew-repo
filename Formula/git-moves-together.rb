class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.40.tar.gz"
  sha256 "03528e38095dda8cf609c6a0ac07808964138ac5af7751b257c41c1a9f67b5b7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.40"
    sha256 cellar: :any,                 big_sur:      "7b76beeabbe56d3f90e6d57bccb33b95cfaa5410a9d95d78077179a5586eb8ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "120e619654cf88018f53144f2beab1372ca95443913ab9a4c0b38139e68d9156"
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

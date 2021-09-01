class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.3.1.tar.gz"
  sha256 "9c58111fdf556ae8a412a301ba7c9d4c92ff65ddad1e1e25b809f0f180ba4101"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.3.1"
    sha256 cellar: :any,                 catalina:     "6bad051c244e5168042a488d0deeb6cd5678649c95f6949129690f5b597dc2ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1cede7690ec650525a587291818ca5e56a8abf5271a8280d7ffc6eb0979d59ea"
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

class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.3.3.tar.gz"
  sha256 "6c1a765e47add592ab05ec7986ef44fbfc9b52c89478545dc2cd6a458ae9a44e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.3.3"
    sha256 cellar: :any,                 catalina:     "b102d46476aab677eee3d1ee4716ea7bdbadfeaa924fbd856803eac858dc7852"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2e137be10ecb9f3747332dbc0aee877643db5e0223b03d71cf1cc8658d438b34"
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

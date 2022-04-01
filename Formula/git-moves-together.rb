class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.31.tar.gz"
  sha256 "aaec501d944ab5e115b02dbd89e0e6af280ccd49598c5ad0a8a2c9ecd38d09e6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.31"
    sha256 cellar: :any,                 big_sur:      "6993ba88779e262787d4b74368c308224391820205d29a1cda6bc4c17f50644c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b39cb1768b26ad0ce6299d98202ba482c3113c9580368c2c358e66f9245fa581"
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

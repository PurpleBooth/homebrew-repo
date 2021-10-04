class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.4.2.tar.gz"
  sha256 "f784412ee39ceef7c44eb8ee9817d3bf5d28298d72849ece5d1312bec19d6eae"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.4.2"
    sha256 cellar: :any,                 catalina:     "c204a622c3f3fa66887d529c70b58f61766f49dd978a1fcbfd6e8a7ec6c447e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ffd88ec135a92d5acd49877d0e9c320ee24b840f796e04b89551b3a99cb62025"
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

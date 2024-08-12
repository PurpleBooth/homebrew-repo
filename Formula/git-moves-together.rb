class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.5.69.tar.gz"
  sha256 "bf041285696d4ac4e4a3b05ed13da5ae2f49bf367aa4f44f217a210e4efc599c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.69"
    sha256 cellar: :any,                 arm64_sonoma: "37009a78418fb4bca75f7f19765dd99a6814be26e86f57dc9f8671775eadd4ea"
    sha256 cellar: :any,                 ventura:      "4ae911facdb3954251eb8ad314a33e5c77ea92d7e06c0dfd2f1e86501c4d5ea1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0e293dfb8f567c153c7857dc30f59e0217e1e401c811d72fd1e99a78d0b762da"
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

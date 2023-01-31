class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.53.tar.gz"
  sha256 "aad08a4b93bd0ba821e655ae5f9235fb00a0bef0550ff62a81a4f17f0673b582"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.53"
    sha256 cellar: :any,                 monterey:     "075f22032b4560c26a25f56ce13277996b7aa5f6045d48ac60b525c8653d5544"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3f7fc2e7e742b210003730d4118d21f644c47b22d4f7e4647f0241ce26b7c008"
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

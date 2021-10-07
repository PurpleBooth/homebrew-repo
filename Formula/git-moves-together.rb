class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.4.3.tar.gz"
  sha256 "80fd02b775db047acbb98024ff91e5368f5d3e7d1d597a49fbdab4f4dd956d04"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.4.3"
    sha256 cellar: :any,                 catalina:     "b8e2d2ef49b4dcf2eef815e02c565eb74a74e17f4fc70886e2d0d3e615f87276"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "21442d9ef36f7f686d2e63e78bb49c1907a068aba5efb9a835056f8fec32115a"
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

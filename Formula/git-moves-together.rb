class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.4.1.tar.gz"
  sha256 "2b468cc2955e16e5717d20c62adf21611401db5692b27a9d99bc9a8a7d77f166"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.4.1"
    sha256 cellar: :any,                 catalina:     "293cd3f5edbfe258dd51e552c9cd0c19ee21f7b135b15a07329660eef1c53f51"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0d1568215e6bed5a2eea0be9918362f94c98396a3be72fd6deae6141b0e49757"
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

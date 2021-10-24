class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.1.tar.gz"
  sha256 "78206ef2876a8def6f782e5dc34f27fe08b52b5e77d3ceda67d2cba8e79ed075"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.1"
    sha256 cellar: :any,                 catalina:     "ebee8fea719c377e06681516cb7c58674d44a6d7e636c0034a7e7900dbdb7a34"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8acf351d9035b578b7d8f18213eafee049f8b40517556c133436166b374776da"
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

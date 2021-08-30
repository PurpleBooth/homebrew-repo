class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.0.0.tar.gz"
  sha256 "b0ba5b997dd33cd9380f3796037e999339ceb6e7289952adc3fa2e91a96272cd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.0.0"
    sha256 cellar: :any,                 catalina:     "1fc7c8e48485e2abee72bb66a86b6e350d7f213b40d3f0a934f747901bbe8566"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a967de80e5c1a01baff49ce060b209a46518206cb6a1635d5886a756b1089c72"
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

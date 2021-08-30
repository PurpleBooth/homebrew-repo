class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v1.0.0.tar.gz"
  sha256 "c7cf2cfa7a02abe5915d14ad2f92d930a47d28a4e728ac4eaf7542aa5c1c378d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-1.0.0"
    sha256 cellar: :any,                 catalina:     "ad12ebd2ed242c817b8e710c865006a49517fc04b63ef53e3402c888c7bf9ada"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e5efd43260f3228206af1cf7fa9f0e66b0a365e8927eda654944c82cc977543a"
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

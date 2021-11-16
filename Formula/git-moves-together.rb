class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.7.tar.gz"
  sha256 "321ee9479340f9effa2d7ddeaf77ba9c5f5e85e1edc1d60bf6f0eb9b6ac855be"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.7"
    sha256 cellar: :any,                 catalina:     "8fab89fc517efaa9a0e9a9f04dde50a6a58dfcd06d0c86df1c9fc4803cee5451"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1851d5917f819a1fae71cc750041c8b7eceff1789412df9d0e3d2052b201d134"
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

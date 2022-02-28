class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.26.tar.gz"
  sha256 "78fa89d0875811685bbe479e4407745d828dad03b92b8cfee0f4f7588cfb7c95"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.26"
    sha256 cellar: :any,                 big_sur:      "f9e173d9923708370c80c29d8f9488c4f00fdb264ca39dae514ecd12471bef9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cc9cde2e1ed3f377c24d535f4165294fc5d2eb81b825ab3cad3dc1b8e6407ddb"
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

class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.27.tar.gz"
  sha256 "ba5d22f1bea792df6603738970c1dc268d8fab740e84e751b894ae650f454d97"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.27"
    sha256 cellar: :any,                 big_sur:      "7fb0ca789b1b7f7f829504faf32268db1cca12c62f499574542141d49f7ca5d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "639087771e10d5ea5011d96440a4056e7ba6c72324126dbf60ab4b108d72c905"
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

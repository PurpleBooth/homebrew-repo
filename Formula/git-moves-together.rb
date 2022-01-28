class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.21.tar.gz"
  sha256 "a26ea86dcc5a7997cae245a154bd8886d63085f5e4013533c2307dbbf7be091b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.21"
    sha256 cellar: :any,                 big_sur:      "e544bdbbb0b29e03a3e6347120dcdc1943c59424b6ce0442c911a83bff68e801"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "da491509d62ed84e7674dfaca38fff837ba3a4ce075d62050faf038ac9bbd969"
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

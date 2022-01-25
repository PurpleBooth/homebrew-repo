class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.19.tar.gz"
  sha256 "ff28eede011f595322f6bc51b3d86f48c6ff915471259cf3b4eac3ff7fabd10d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.19"
    sha256 cellar: :any,                 big_sur:      "cafd2d6382561550fcb26e9db1ffec9e820659646d74071cb2476a8b2ad322e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cfc8c4b07a26f122d18eb31fd5363b9b317525f02895880a23b470709da53565"
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

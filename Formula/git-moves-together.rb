class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.28.tar.gz"
  sha256 "006611d733ef444879804398a6a533683d8272ce025ca3178fd76eb4f671b305"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.28"
    sha256 cellar: :any,                 big_sur:      "9181d2313a7f32ada9ffefe7c6c0bbb0f8db96c2abcda04d64cd3876ce51e3fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "78ccb2dff2f2503b21585cc409e759c6ffeb52d14b31e1c7f3b60d67da9e21d2"
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

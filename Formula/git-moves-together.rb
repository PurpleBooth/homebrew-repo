class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.16.tar.gz"
  sha256 "c64c1d630af3c718a070c5a00646a18a58fdd5384e96b5033729a25765b1f445"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.16"
    sha256 cellar: :any,                 big_sur:      "4f3dd8877e522d234f4e8621d9f909478076da1a33568821f9e773547ff4b1a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d66c192758cf7e90ba3742709834dc1af1bde5d73e9e2ee429d70e47482324b5"
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

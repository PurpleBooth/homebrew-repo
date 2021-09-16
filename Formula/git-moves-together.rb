class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.4.0.tar.gz"
  sha256 "c865a297c969e342b8a3e6980559eff3e10456a49e30a336de2d4c048720fa84"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.4.0"
    sha256 cellar: :any,                 catalina:     "c67c143e8edeb6f9d8f9c3c5cd1423260b5fdaada06b591a9e2f09a2be31bc13"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c844502cde9a2d7e3ef79e47b1657dd8546e420a97be7343817ea18fb20b6b54"
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

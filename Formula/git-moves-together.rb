class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.38.tar.gz"
  sha256 "1060b6094468104ed31884932d583597fedae6c23ec82bdd4f789adfdf6d7c8a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.38"
    sha256 cellar: :any,                 big_sur:      "fe87fee5b9938d256fc3da6cec465dc0d3edda6d03aa0d92ff7c3f4a979ebaf0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "549b79dc640b109d2a644194f1415711e3614f1daf0b6901cf733f0e83b9eb25"
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

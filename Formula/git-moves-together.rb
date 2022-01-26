class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.20.tar.gz"
  sha256 "82a433b638c8cc32e4ba0b40300fa7ae0879805473e75876244b60908de0d9f6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.20"
    sha256 cellar: :any,                 big_sur:      "7bc685f096babd641c522d3da55f8006012a05fb7c557baacd7f2f965a80bbab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "762d6f4f23d8080ff4898bc4abc3089d77de5d4c3982226f5431d32a2f833bc2"
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

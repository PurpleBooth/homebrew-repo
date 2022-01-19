class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.18.tar.gz"
  sha256 "a7233e8b2f25579f11cddb39b6c7f3ebc6ba094f498304d0b9e4d6058427900c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.18"
    sha256 cellar: :any,                 big_sur:      "b0962da69a860f85ece26aced860e05fc02abe19aa2d32f37ceba200a7cd087d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "71a693815551e7876182006cdf02eaee70758c2f1266af5212528cfca4527087"
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

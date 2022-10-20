class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.42.tar.gz"
  sha256 "e28789acb063cc015f713833ac6708997c63ede530a8f8fabcef6d4f8e4804fc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.42"
    sha256 cellar: :any,                 big_sur:      "e89bdf0cf19756aec68779142ef1e12ab5f66ab3bee482b802a2a0ffd0903fad"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7a60e50dfc9472e4ed10364fe75518ec8c21a7fd0f1bc60d1c15047b7fe4c59c"
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

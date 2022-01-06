class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.15.tar.gz"
  sha256 "777fd2dd6325962791d02d92aa6ed89446a00936b62ee0f9a413c2ab2ffe83de"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.15"
    sha256 cellar: :any,                 big_sur:      "0e696c3339367269c2127e23fc85c6e8509a24bf7fea5db4a2f57de18e4b9395"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "26f711b3adc25b09e32f9add919bf691c1c558a93104f4fce8869350d2ad9962"
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

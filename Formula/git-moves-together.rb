class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.4.tar.gz"
  sha256 "e2cac344792997665fefb44d846801f8548643f7a611f813b4b1f2854b261ebc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.4"
    sha256 cellar: :any,                 catalina:     "845cd39e5b0b395f9957faffaaac0d71be0479d309c4d18372c6ef95e847aac5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0cdb391c059fc4d009350507fc5eece06a7b29eb031d037295ae01b9f321421"
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

class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.50.tar.gz"
  sha256 "5ed627aaae6c619aec5131e6d054dbd674d18b0663a5aef52c620ab465c14234"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.50"
    sha256 cellar: :any,                 monterey:     "e2fca73ed41bb2334613e36c1a3d6a8bf464db5f9edd63bcc7523818e23b2f32"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "589197202c937b0d4670d127431dcdd3275da400803cd5fce2bd4ef3d67c6a3f"
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

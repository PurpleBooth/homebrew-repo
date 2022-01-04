class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.14.tar.gz"
  sha256 "ea44feaa76cfbc7baeb35218c780634c9a81bba033a1a0eb328c3e0497b98344"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.14"
    sha256 cellar: :any,                 big_sur:      "66b65bec678fd555cfd1c9c144c4f396e5bf204cb2f276edd1a78e6303eea18a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a63960464bfcfb82bf2250d71d878eb446ac4210e4e8bc975891d42a5a55519c"
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

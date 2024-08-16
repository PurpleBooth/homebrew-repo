class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.5.70.tar.gz"
  sha256 "b0fc1a4e2db7eefca607f0462e946483a1e31527899a64984719fd59af57f9ea"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.70"
    sha256 cellar: :any,                 arm64_sonoma: "88f634f191640fe4d449f694fc43205fff25092c24402223c9f45012409e6977"
    sha256 cellar: :any,                 ventura:      "51ae2d695dbdc3437f283b6c8ec0e5786e9de792826fa48efae3fa1e85645672"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b22c12a077d992ecf29f02ff1e8ff472e65c7c3fec552eda67f9e4fec19460ce"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"
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

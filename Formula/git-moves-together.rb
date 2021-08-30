class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.3.0.tar.gz"
  sha256 "d3cff1906feb91cdce2508d8de243568c51019e93d5b62a80ba1c7a149cb70c9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.3.0"
    sha256 cellar: :any,                 catalina:     "7786cddd10ca07356b91866371070dd7050b330daab60fe2d46e2dbf399f2cd6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "35963d4113269d07ab5b94ff4af31380aec086a393593c3eb26677c038d34350"
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

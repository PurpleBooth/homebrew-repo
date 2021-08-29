class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v0.1.5.tar.gz"
  sha256 "807da44ac37a76c96ac3a3aca4383de63bfaf5a7306303cc2ba1220253d19dc5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-0.1.5"
    sha256 cellar: :any,                 catalina:     "1ccaf4fd5b5670ff935eb619494d24af39356ab9912b6e6a0098767bd03406fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a62fcf15588ca47e7d05a4e659997577c313d142201a68d9a947d973403001e4"
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

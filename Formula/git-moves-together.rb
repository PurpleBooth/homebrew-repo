class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.3.2.tar.gz"
  sha256 "d7da2eb9970140524a1f3ee5210a58ae8dd033a1ec600663dc8494863622a523"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.3.2"
    sha256 cellar: :any,                 catalina:     "13831069c242aff4358c0d3a6b6d4eb9022844bfc0ca26a41131646fc8397bfd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a3614e6608996b1a212b706e717b4199e6628ee79d71b8bf9f6ee9e999a32147"
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

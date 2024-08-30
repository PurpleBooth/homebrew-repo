class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.6.2.tar.gz"
  sha256 "ed14e31a0cab914e755f1e384d1d98704edbca27999472619654679f1fde7f0a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.6.2"
    sha256 cellar: :any,                 arm64_sonoma: "cfe76efa6540faa78a18c42d856122cc78b19ad7a44766f1df9b67947898d1d0"
    sha256 cellar: :any,                 ventura:      "be70597eb83e0140925febac58fe61091b5a3f9a6e9354fa8723aa41dd955ad1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "09bfeed5d3e94eb108f76e1e6c60c3edfe5605690e338528a36f7cfbcdb54244"
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

class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.5.68.tar.gz"
  sha256 "d047a02f60d7884a0181a38116ee9103ea37b70a0df788b49b87956b0404a52a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.65"
    sha256 cellar: :any,                 arm64_sonoma: "b8ce732f0bca52ff49d0cec3a8485686a463bef7a190340a4cfba5e200a3e8f0"
    sha256 cellar: :any,                 ventura:      "b3cca5217cd4c98f4a4605a890f93e19126b1af0dc4b63145b6490e63eea6ad6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6298fbfa786d88ee2a1219cc84bfc18b9319c7ad9fc3f58e160982d9ee650cca"
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

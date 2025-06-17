class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://codeberg.org/PurpleBooth/git-moves-together"
  url "https://codeberg.org/PurpleBooth/git-moves-together/archive/main.tar.gz"
  version "2.8.1"
  sha256 "5090f9dc84ba08dc6840ccdc771780dc0c6ec1012772e1d554aea372495deb32"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.8.1"
    sha256 cellar: :any,                 arm64_sequoia: "02d61179de0165b787dbbc1638555f6a6ac5d07d7873f4d6c3683028fe769343"
    sha256 cellar: :any,                 ventura:       "711476e522e2bc7156e9693a62c54434e0857af4dc89a9aa3f9bbfb673a0618e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "afcb2a9f3c20aad12799b1333c4ac0de9c1372ae6c764fc869006fd898edcaf5"
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
    system "git", "clone", "https://codeberg.org/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end

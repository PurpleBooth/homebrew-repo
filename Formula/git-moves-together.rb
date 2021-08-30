class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.2.0.tar.gz"
  sha256 "2bd23896c76b09f2ebd2985423505e59c26eeb3110a0739cfe843c8940a67cc6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.2.0"
    sha256 cellar: :any,                 catalina:     "bf637401fd1d5f7bb18f210092c2828b367a74296f19a7972935550568e285c6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4cfa33019ac6081ec9df3277a2a3596f7366ca86c88e84bdfdf9b05a5f52a84a"
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

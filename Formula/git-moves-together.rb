class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v0.1.2.tar.gz"
  sha256 "43fc835fea06e0807db2c6b7190df78cbbed9ef26ee7d64dfeffa9a3210227b9"

  depends_on "rust" => :build
  depends_on "git" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "git", "clone", "https://github.com/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end

class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.43.tar.gz"
  sha256 "5db1533de6a5130fbdd4e996f361903b1e1297ea3b66cdeeef5f50996b744ddf"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.43"
    sha256 cellar: :any_skip_relocation, catalina:     "fc35de034db5e670df22cf5b154f7db2facbc4f1e47e7b71b46ddb995204fa63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b6e6ac0759246c4132c16889de2d94a5db2426beebec4af75622911096684bc9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/game-of-life", "-h"
    system "#{bin}/game-of-life", "-V"
    system "#{bin}/game-of-life", "-s", "1"
  end
end

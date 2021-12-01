class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.45.tar.gz"
  sha256 "1c888637b50a6490defa5c052f42c74c3ddbdb259ade9fd815a2b18917b485f8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.45"
    sha256 cellar: :any_skip_relocation, catalina:     "712ede35765089eaedc4a7d419207935a6537a09bac8594772b3893617ee750c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0c9ee20b8d3a1181b210e5c82b16f763dd7ab8c64e00992b5fd2593bf172fd1"
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

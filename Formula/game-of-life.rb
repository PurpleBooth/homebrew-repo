class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.44.tar.gz"
  sha256 "3f45bdf881cb69a1e9c5b042aeedceacad382967b7fc358981e2de147e7dc92b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.44"
    sha256 cellar: :any_skip_relocation, catalina:     "8034f45f0c83e303a5b352ca5b90b6be14406e0cb12a8ab20fdfed735137d66d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e6917fd26f12a103edcb0ee3adfe9eb38bc25443754f32ac12d06c00767a3715"
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

class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.73.tar.gz"
  sha256 "471ef04dde0f51949ef1e8d7a7ae81f1355b6c693203e84e97e5b6ba2e0dfe07"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.73"
    sha256 cellar: :any_skip_relocation, big_sur:      "e3a8fcc103654dcc3d1edcf8b3577668c0012029fc845ad79240d3645fb6a17e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c399da829e90c4ffa8031a11da89cb56529c39a3bc2338fb4fb1e5925966d8fe"
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

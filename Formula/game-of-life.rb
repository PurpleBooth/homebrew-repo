class GameOfLife < Formula
  desc "An implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.10.0.tar.gz"
  sha256 "5cc4bb9e4f978bd0266e4206522b2e55f9a8f26dd9572cc37abc9f6171e673f1"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/game-of-life", "-h"
    system "#{bin}/game-of-life", "-V"
  end
end

class GameOfLife < Formula
  desc "An implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.8.0.tar.gz"
  version "1.8.0"
  sha256 "5a74890f9373a07817ba277da8d7d5c9ad312b7ce04f75d14512cc4df6620016"

  depends_on "rust" => :build

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/game-of-life", "-h"
    system "#{bin}/game-of-life", "-V"
  end
end

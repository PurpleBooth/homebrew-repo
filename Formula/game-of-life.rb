class GameOfLife < Formula
  desc "An implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.2.0.tar.gz"
  version "1.2.0"
  sha256 "256775e56a57205b28b518382292c636607ef31c8e8459b47b3e1e9d3e67b7ec"

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

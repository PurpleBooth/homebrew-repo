class GameOfLife < Formula
  desc "An implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.7.0.tar.gz"
  version "1.7.0"
  sha256 "e3a2f9345fb5716cb4d7d2e2581e70d7a25fbba8df19bd1a627de1b8bb2449c1"

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

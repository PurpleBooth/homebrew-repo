class GameOfLife < Formula
  desc "An implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.3.0.tar.gz"
  version "1.3.0"
  sha256 "4773354b09ea106a7ebd9e1379977c590becd55a74a2992f4f35d86c9c3f13de"

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

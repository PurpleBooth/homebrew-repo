class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.57.tar.gz"
  sha256 "e3be4ae0d7deaf36f5b3230a8fbbd2acf662d5700f2cb0e23e6981a1d0b3c718"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.57"
    sha256 cellar: :any_skip_relocation, big_sur:      "2debebf8c5dbbd5c09251861a24d9682446e11ad6fb603c17e84d742cb313df1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c10926fb3ed6aea2cfeca9092158f5b3704f07796e207118b2fd51fadf0955fb"
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

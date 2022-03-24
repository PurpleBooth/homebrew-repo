class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.58.tar.gz"
  sha256 "e1a42a714653072799a903d4a19e24d4e017e070df9eda3693f6abb489314dca"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.58"
    sha256 cellar: :any_skip_relocation, big_sur:      "8552cdec652eb4b35fccf80590c63e4b742c1cdaa4e7df817416a18321aa1379"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2471403337b5ff0acce97e0bd6ae20d6e7f4e624bd34811e29c2c762e85c9416"
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

class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.61.tar.gz"
  sha256 "b1a542ceaff5722891f02d1e6c4685b39ec8e6d79c036040b8557cfbdd175b7b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.61"
    sha256 cellar: :any_skip_relocation, big_sur:      "a55264fa0ebd2a74cd1aacc419f9de91007dbac66c6be58c89b9a4aece3bc2c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d1c4c400a649b1bb326067460f73327d7de64b095429c07a5b1a11cce6a2285c"
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

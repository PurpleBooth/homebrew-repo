class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.75.tar.gz"
  sha256 "2e1e9a5ea1f848d87e519ab2055010d7af83b4fbbf1e46585b1bd954d1235d4a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.75"
    sha256 cellar: :any_skip_relocation, big_sur:      "7b5d86335867f6ef9bf9e6837e9b03064e1253612a0cc3cdfeaab60a7a3ce5ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "43e67d5cd51929da8fde85951b26d2f505e76331a3d3bd417066b94fe938e270"
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

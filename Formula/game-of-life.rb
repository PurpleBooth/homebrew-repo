class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.20.0.tar.gz"
  sha256 "d3f306af483bb858e18e4ae84350e3aa417822e648521e9e04a7370a7bf74fbd"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "adcf7760f5fdf00bbe29b44fb0dfffa2462e9fba992f98c9f46c35b22a8fe3ee" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/game-of-life", "-h"
    system "#{bin}/game-of-life", "-V"
  end
end

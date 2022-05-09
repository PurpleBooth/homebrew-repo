class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.64.tar.gz"
  sha256 "dda4ca1393d3caa41ce535ee7021e33e31ce02ef92f3709911bf7f3a233cc362"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.64"
    sha256 cellar: :any_skip_relocation, big_sur:      "fe144893af37987dc54457e6001889718bb5aca4f9b9040ba7d6b91fa81356d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "68699fdfe965e95a1dd7a575c6beb5aef639268c994a74eca0309d40e9966964"
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

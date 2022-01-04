class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.47.tar.gz"
  sha256 "f31401a785efa6fda5e4c1e9270f1b1942c7316931ada08911b7e12c00e8e6d7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.47"
    sha256 cellar: :any_skip_relocation, big_sur:      "823d3d52ddcc33a99aeed970c31db60b020469736f50443eb90d5fd1a7f143a1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac3cc354c0fbd1b4b397b961ebff1eed0ca10d30abd1c8f63d9a3603039c4a94"
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

class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.56.tar.gz"
  sha256 "4974ce061431b369b4a02c9b502e3a2de5560cb57dcb712954a4217d6135a114"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.56"
    sha256 cellar: :any_skip_relocation, big_sur:      "99b66ac34377af0cce0a578b1e753ac6af056c3d368fb94f69f139cdc3f4c445"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3064321344bac5dab17bb588ffcce4fd940dc1bc9e1da1810f0c87262c639bd6"
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

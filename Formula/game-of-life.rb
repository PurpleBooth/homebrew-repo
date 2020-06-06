class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.22.0.tar.gz"
  sha256 "52137259d18045c6f8b794a59bd29ffdbdb39f6229551b8acd979352a7b5d392"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "2109bd75cddadb0a4ad8c1493b3757317f591b0762b92b361dec2328f71ad816" => :catalina
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

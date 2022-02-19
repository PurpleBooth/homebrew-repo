class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.54.tar.gz"
  sha256 "e45a3d71aedbbe4e20bf9befeedbb1bb82108951e0b0b553eacfbefabdf4c9a1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.54"
    sha256 cellar: :any_skip_relocation, big_sur:      "3bafa78da90c7cd95f256154678f82f5a199ea01914f6b8d3a3bbf2060d4ecdc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e2940aa09f0016379f02ca1ddbd3d8a47631819d81ff6af97c38fcbcc643b1c5"
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

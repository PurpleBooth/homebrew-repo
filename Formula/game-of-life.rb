class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.51.tar.gz"
  sha256 "02b0868bfce6e8e3867666fb6769cbeaf9023f4f818cd82c557b8beb6485e7f2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.51"
    sha256 cellar: :any_skip_relocation, big_sur:      "22fd34b0e36578c4bd1893f0c906a07f2832b0667b6ca7324b353824bc2858d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "19b91d840960d0a6ad4bfda24d2aab885f1546b2d0c5ca96a6ff599b88f26a86"
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

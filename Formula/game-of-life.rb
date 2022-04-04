class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.59.tar.gz"
  sha256 "4c0ade885553c36c1393ba527f1f3b8b84756506218ea70add3e53f6ca40abfc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.59"
    sha256 cellar: :any_skip_relocation, big_sur:      "759c190657d8cccf5ece55947a7f2cb833b89c4257caec81ec4a76e9b74c4d1e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aa5d05c8b74690652b36492815c60d38eec6c3dd33723e6b8c16fdd39760b28f"
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

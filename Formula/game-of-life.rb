class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.67.tar.gz"
  sha256 "3d05d3e1afe0db2b72e106ed474faee1faacc770cef673048cabd3b49072e698"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.67"
    sha256 cellar: :any_skip_relocation, big_sur:      "7122393f351c2e26a52a002b0f7eb953d9ef0f3459850a6d9b95fb7296bf98f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23a74eb0453f076bf3559e8b5feb82dba350aa0828c4241eb66ad37bf2ab0fb6"
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

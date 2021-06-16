class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.41.tar.gz"
  sha256 "055a89f39f42c5a30202b144935abfdac7ffdcefd2f14e48f912a2c630607e7c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.41"
    sha256 cellar: :any_skip_relocation, catalina:     "8bef7e93bc8bfcc01ef4c6d53ee7c3938d9d602b0faabd2559334d410369b4a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b43ad0730a7adba64cc2451c64d8e875fb9e1ac294a55f7ca6e1f38ad293dbc"
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

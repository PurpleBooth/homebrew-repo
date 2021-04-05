class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.34.tar.gz"
  sha256 "bb3d23c7f07c8e96199d6b3d9978106757ef96adb60880f4dad6760b30ee4142"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.34"
    sha256 cellar: :any_skip_relocation, catalina:     "42f59df6cc250fa729cabbcc35ef91f67e55e5c2ff19faacfcd94b3f1f5f33c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fef4dfb011bced929b44c924e4d17835c4c39337691b500ebf3d6d9f9c84d5a3"
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

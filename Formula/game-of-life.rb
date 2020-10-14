class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.15.tar.gz"
  sha256 "e1ca869c8595a1cf5c5528353f13d0d12e0fb0f10bf2630e8588bdfe3ef65cd5"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "2778471a75cbb1d52f0876ddaa014d67d54997831ad5f5e048b191161bc6d299" => :x86_64_linux
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

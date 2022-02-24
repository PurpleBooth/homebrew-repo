class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.55.tar.gz"
  sha256 "1fbaa93ddb72ab6ccf16c639f4f7fd2a327cbab5a5580fc08edcf4b71be79c90"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.55"
    sha256 cellar: :any_skip_relocation, big_sur:      "63e9fbf30c1c33bc6b76c70e5f5a816ed1621bac2fd7d099ac25eb6b5e6a09de"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b6a20b83c4a9eb7146af96fd0afbf20d98992f4f42b16c2e793f8249ca8377d0"
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

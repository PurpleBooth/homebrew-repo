class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.52.tar.gz"
  sha256 "535877aa06e3bd1f5a2c6c5be7c1fa7aaf8cd6b09118f50640f3be08c4455838"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.52"
    sha256 cellar: :any_skip_relocation, big_sur:      "dcc8c61677bffab310e0a11e64ca5e223ea5f82681adaa4b233f08280445aef6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "85df1ffa7b300ff6d87bdcb5dcdf890c675518b80e5ed5250bdf5fae10b0211d"
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

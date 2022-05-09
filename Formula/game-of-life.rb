class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.63.tar.gz"
  sha256 "c6a704d9e1cb7597d8de47f405e02f825602fedd291b1c8b48d37136ddb3e18d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.63"
    sha256 cellar: :any_skip_relocation, big_sur:      "ae7dd351770067d10693827dc23cbf9fd13169a092e1748e7671b314b7b8de2b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9fac71693887839bc34af18a81212f0eeb419898a833fe178cc1aa89b961d1b6"
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

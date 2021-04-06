class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.35.tar.gz"
  sha256 "082b063782eebdc61d2219383756bfbc9ddced2c8bc61939ec7182444a35fefc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.35"
    sha256 cellar: :any_skip_relocation, catalina:     "99ac4fc91ec8972cda94b0d8bbe6675e9fb0bb5f9bc19a88f6f7b85ad6bbf77d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "67b2ecf7637638f58e27692444e439c50a7be88e7131daad8c6dbc4fb660c243"
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

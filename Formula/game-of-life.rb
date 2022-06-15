class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.65.tar.gz"
  sha256 "7c978f424d274df5cbe16f5dac9c9e2975e530be96eb25049ab6fee7602be258"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.65"
    sha256 cellar: :any_skip_relocation, big_sur:      "dd0b5721d9a4b657a35913ea683234efba971ac105341c84b4a2c3ac32cfcb2a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "726d3dbdcc7452968fe403b6d549c751e0a769f5ead2c6f44bae8587d5e1fa71"
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

class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.50.tar.gz"
  sha256 "b1f8ff637963bca7094253a1786dccf3cf2caf8aa13413c04ccd2e8a82e27ed8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.50"
    sha256 cellar: :any_skip_relocation, big_sur:      "0f513ea291f602a46de413445e4058929fbe3b71473d759eeafd747c288bae04"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1e147f5b1f82a63e4184048f308c263423cb49dd1a0db76a4667d5d579dd4ba3"
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

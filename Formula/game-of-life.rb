class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.42.tar.gz"
  sha256 "41d00449c986a14b7a1c050a68c72d04dee8fd4f0ed222392b8517439c8367f7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.42"
    sha256 cellar: :any_skip_relocation, catalina:     "912abc3c73684ae809f75d873905cbb333ecfac77cc72eb8f92f3edc28caeb79"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac87d1d4194dde0787479a4ecc655230a0cf76c6659d88466e500b0166b72214"
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

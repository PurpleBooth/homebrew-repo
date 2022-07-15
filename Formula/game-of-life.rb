class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.70.tar.gz"
  sha256 "1c724d267ceac7e238786b46f12df3d03daa2a503f2610598accbf8f6c07cca2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.70"
    sha256 cellar: :any_skip_relocation, big_sur:      "b597d36354cb86cdc6c608cb7973cb8c425fc33192b571564f7322feb1f85733"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ef2823caef354fbc5a075262d86a60fe8ab25421539e1743a0b974299d9bc330"
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

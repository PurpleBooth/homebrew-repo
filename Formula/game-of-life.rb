class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.53.tar.gz"
  sha256 "1d4f11e1d0af385865a4d597ddb7a6e7a86bf3229f85af4fb9439d336db05516"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.53"
    sha256 cellar: :any_skip_relocation, big_sur:      "2534705b68aac0f6fcfc1cccf72b6e8b4158337e7132b392758edced792c1108"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "94cbbdd3837dcbe99d8007fecb231dfbbad08b92069cba9639913d3960af97d4"
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

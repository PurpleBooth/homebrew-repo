class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.39.tar.gz"
  sha256 "0d0c355d8bf3e91836b056ad906ec1edc82ef18effe26585d0cb51b7e5acab72"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.39"
    sha256 cellar: :any_skip_relocation, catalina:     "3c559cbfebdffddbf0411612616b0c642ebb11c35600928ba9306c0229501879"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7e54da08d59380cf433db35805685be8ff15f5ee6361e56156073243e17f6297"
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

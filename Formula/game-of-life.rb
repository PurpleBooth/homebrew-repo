class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.60.tar.gz"
  sha256 "4ffae4cca9e3eaa43c405d062d56f8fd7fc8f156d067ffba2a4ed26d030ede5b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.60"
    sha256 cellar: :any_skip_relocation, big_sur:      "78af7df75b6a118405ce9c19df718fa121ab85dbdfe238f0b39934eccad9aaea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3f7ebfd50a86af745f5ea25c20beda1872b4f43a5b4664b3578b9859e3a3b9b5"
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

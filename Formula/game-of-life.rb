class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.69.tar.gz"
  sha256 "605c415719a9a311186a264337be785b0757e9b3d90b6627512ff6a1be084a8a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.69"
    sha256 cellar: :any_skip_relocation, big_sur:      "98806b1e1804e93f9dd12a65e461e03c35498b27d6211c4c67e53e47adae9f6d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7b64d66fab3699f155fec57c7852df623a81dbefff29c7131031d2ad4a20870c"
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

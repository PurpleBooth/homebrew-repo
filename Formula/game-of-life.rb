class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.49.tar.gz"
  sha256 "07dc2a842c61c0cb930bc96f1e6f1bd43d82e455f98fe95d7e8c704b21384cfb"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.49"
    sha256 cellar: :any_skip_relocation, big_sur:      "956312dc20edb939744017d4899ed0da1d0f282c25244c56f509fd2664db568b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "01e8e3c3af033542a734b7571c44e0d43e7ef0dd422bf16f48a28f500b8da62a"
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

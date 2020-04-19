class GameOfLife < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.0.6.tar.gz"
  version "1.0.6"
  sha256 "d21f28632e41499b830a8caceaeda1382c009aadac7185bacd2e3ef254f688e0"

  depends_on "rust" => :build

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/game-of-life", "-h"
    system "#{bin}/game-of-life", "-V"
  end
end

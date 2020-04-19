class GameOfLife < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.0.2.tar.gz"
  version "1.0.2"
  sha256 "343e61e72eaab8a3292b5acbaa40cb71537eeb44e2f0d9d7673a1e79a6eecfcd"

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

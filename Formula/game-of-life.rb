class GameOfLife < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.0.5.tar.gz"
  version "1.0.5"
  sha256 "550993de7e84c328d2f8243c1870f1aff03e176411602740e9c59a924aaffeca"

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

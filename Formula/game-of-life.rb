class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.72.tar.gz"
  sha256 "7f345db43b99ae706b880ecc299c4b5311fe329453e5c2a6ed1630bdb5543e5f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.72"
    sha256 cellar: :any_skip_relocation, big_sur:      "5486b31cd6b1084b5a97ae8b42fe531da1781c9fb0c3e066041e16cf2a41e976"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ab16cc1d16eceba1afb72974ea7f5f968e3161af550abd245a46479fe7a5fafc"
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

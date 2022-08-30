class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.74.tar.gz"
  sha256 "324c00d5966ee6158bc3439d60f97643252f4563ea867ff8f89f7d23bf20958e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.74"
    sha256 cellar: :any_skip_relocation, big_sur:      "8654cb1e5ee3b6de73678699ff58ef37ff5e1a2dc14934eba95173df17256936"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bf3bfd214bc3908d2a6689cc87fbb4dbaaacc18cb7d7394ad6774b4091456f48"
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

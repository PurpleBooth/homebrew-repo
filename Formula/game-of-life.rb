class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.68.tar.gz"
  sha256 "a517390955821bdcf1896809b82f5949de9e9304db0a139b52241acaa48307c1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.68"
    sha256 cellar: :any_skip_relocation, big_sur:      "7a9f791c17e6033b46d34d87645d390f6155aa5148da26cd2fc7c1885d5e785d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e1b5c40b2c0bf8ea2b1d3b16a457fd5a67015f36d3c0cb52f4be48f2e2ab5fbd"
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

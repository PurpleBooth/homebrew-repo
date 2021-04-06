class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.36.tar.gz"
  sha256 "5019e15cfccd14661316f60ed4292cc026be8d606062f5046644e1b1f13dadac"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.36"
    sha256 cellar: :any_skip_relocation, catalina:     "996f1f38eda175f715ec29fd465328ad5471e56be77f4675e63e5525458ba118"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "110c1afde604133ed9344e833f90898c5920bb6301a5505e5b29a6257e65bc50"
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

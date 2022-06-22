class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.66.tar.gz"
  sha256 "c337b458996029f62884b65adbf24407f5240819703cea13dcecc00e124c98dd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.66"
    sha256 cellar: :any_skip_relocation, big_sur:      "47ccf5ecc8d8716d388911542c57b6814b92e05e5f3825970364d741bb51cc3b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7ca6f8d8858806ff8774d196cd1b429343e01414892fd2ae5ab7237a6cd33806"
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

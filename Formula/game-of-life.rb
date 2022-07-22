class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.71.tar.gz"
  sha256 "492752993f9c083db156c6774d767ab154049911c01db9c65f3e12fb8f552b9f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.71"
    sha256 cellar: :any_skip_relocation, big_sur:      "0eda5daf5fcb2d41893f4be5dda3f66e7b21849fdd4184dbdec206a5ca4fafef"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "967eacb6f50f77dc6419dfc46cd9df54b0a58e39aad76392306429d09f1b39dc"
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

class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.48.tar.gz"
  sha256 "fef441422caea466e6a912bd6887640b706ebbd303eaa7a8a62c43a6018acbc2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.48"
    sha256 cellar: :any_skip_relocation, big_sur:      "f286f5ce26db59cc03acd5e5ecf5f2b7a700a93ef016d46a11b0f536a9a3800e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "05bc61ab3029abe4eed89ceea4f0b5979397e5358dbedfc832e9cf5eef5db775"
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

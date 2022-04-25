class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.62.tar.gz"
  sha256 "54bfa13ef25c95e05d491933a895a0c9f824df409c13b877063253e8da7d3671"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.62"
    sha256 cellar: :any_skip_relocation, big_sur:      "4ebee44fab2c0485b421aefbf97602b3bb8a72a88a16eec176f16aa4bedd3dc4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0f9c85143348d35ba626ace09d427e562b40868e906a955f48b328b78ca914c9"
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

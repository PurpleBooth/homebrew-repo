class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.40.tar.gz"
  sha256 "24a97722dc7f0b49eba887d433132c7059eafc6c359774aa3afdc3eec2b56178"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.40"
    sha256 cellar: :any_skip_relocation, catalina:     "26175cf43c27533297a5f45162224a570daff4ee2908c4ea39385f757a5ba14a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "647f89fce582b735f9f96b827ce75803a223e3c900aa2733b009c8445b812c89"
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

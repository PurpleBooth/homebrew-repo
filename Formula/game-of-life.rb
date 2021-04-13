class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.37.tar.gz"
  sha256 "ac5d71fddfb0f7d1840bf617a1b14da9227b113c1974a55a61e26ecaa2f882f5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.37"
    sha256 cellar: :any_skip_relocation, catalina:     "3eef24a7d4f81414c012c38dc15a1aa71783ae7b6539d488d6c3b2b25b2f851d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1b7bf0e254f809d607b7f62d79a087c5c21dc76a317f2231b4c229bd7a8007b4"
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

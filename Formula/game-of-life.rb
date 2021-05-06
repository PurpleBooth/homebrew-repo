class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/refs/tags/v1.53.38.tar.gz"
  sha256 "228530853c91554c9405590ba87e2e951a8271af32a82b454d54ead0599e6d68"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.38"
    sha256 cellar: :any_skip_relocation, catalina:     "6a9dd67567e84df4aa84e41a7768f85d4a39ddf211fd96c1174524a9da958aad"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bcc3e706d0fad6afec01d56e7b8b016008173cd34f21eb456b4d1c93a0ad61c4"
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

class GameOfLife < Formula
  desc "PurpleBooth's implementation of Conway's Game of life"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.53.46.tar.gz"
  sha256 "1666b4327a40207cb383594a96ecbc1dd06385c142f90eba1690ccfab69e4fb3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/game-of-life-1.53.46"
    sha256 cellar: :any_skip_relocation, big_sur:      "9fb8e8ee2ef0789621a3988b6071cc622880cb4bbb2b4d8b3e091e94abff8bde"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "18efd597cbd5630b14df718f8aa460eadb82d8941b632149d5c29fb6065abb0e"
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

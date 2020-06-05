class GameOfLife <Formula
desc "PurpleBooth's implementation of Conway's Game of life"
homepage "https://github.com/PurpleBooth/game-of-life"
url "https://github.com/PurpleBooth/game-of-life/archive/v1.18.0.tar.gz"
sha256 "2e30fa3e193057990dd435be7094b6fa56bd6925ffe7be7695c0275da29a7a06"

depends_on "rust" = >:build

def install
system "cargo", "install", "--locked", "--root", prefix, "--path", "."
end

test do
system "#{bin}/game-of-life", "-h"
system "#{bin}/game-of-life", "-V"
end
end

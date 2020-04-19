class GameOfLife < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/game-of-life"
  url "https://github.com/PurpleBooth/game-of-life/archive/v1.0.4.tar.gz"
  version "1.0.4"
  sha256 "16eb7267df6dabc101191d7d77beb308c931dc6905c293b1ec1efb38790e812f"

  depends_on "rust" => :build

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/game-of-life", "-h"
    system "#{bin}/game-of-life", "-V"
  end
end

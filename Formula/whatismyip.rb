class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.9.tar.gz"
  sha256 "4620599bca1e3a9425773bb371e55ccfbb9e23e1690f5c0d4d569c92094d02a8"
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end

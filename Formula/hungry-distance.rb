class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "13af789a5aeb5650928cbbb4a7b547dc850b96d9722777b987140e648075b097"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/hungry-distance", "-h"
    system "#{bin}/hungry-distance", "-V"
    system "#{bin}/hungry-distance", "-11.46875", "39.78125", "22.78125", "73.875", "-3.5625", "-52.625"
  end
end

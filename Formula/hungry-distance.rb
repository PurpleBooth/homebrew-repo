class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.19.tar.gz"
  sha256 "ef0ac546e3730838b8b60ec70a1919fa3ba43f8e941e572eb16b1a4dad2d9bff"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.19"
    sha256 cellar: :any_skip_relocation, big_sur:      "35f5df2b3062ba7a923c5af4960c7c42c5b1c76f22d2b2f2b563043e0a8dd9e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b3b63acb97b2aaa7d71632ac916e5d742d6e4a8431bf2f77a327a0ab33aa2999"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/hungry-distance", "-h"
    system "#{bin}/hungry-distance", "-V"
    system "#{bin}/hungry-distance", "--", "-11.46875", "39.78125", "22.78125", "73.875", "-3.5625", "-52.625"
  end
end

class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.22.tar.gz"
  sha256 "08c5a5317d4dd739656f1b39fb9e7ebb06e0bd71cfb57cb6c45ed7afe3c7e890"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.22"
    sha256 cellar: :any_skip_relocation, big_sur:      "4443371cb8827267960f4e9eece1705b3f72679569105274cb4886e13ea8f11e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c0129c934391b13fa627fb7014b29b40b65758b33f555c38ca4c9709abe24f15"
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

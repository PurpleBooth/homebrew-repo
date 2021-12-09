class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.11.tar.gz"
  sha256 "7e1945977768cdf581cec5b356c633b4243b5e9d2424ac6bbf4591efac8700ff"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.11"
    sha256 cellar: :any_skip_relocation, catalina:     "33a2f849234c3a0dbafaed251ef80761704d60e6fee30d4024000f6a0c39376c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c4fb8636e7d46076f23d8ef4e03f8e72aa15650f39c40968a1f7756c907b9f35"
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

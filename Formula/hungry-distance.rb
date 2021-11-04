class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.10.tar.gz"
  sha256 "175e4ac85281de2b0145a01ddef2ac90b6f66e3e72ac615eb531b9c028c3d1c2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.10"
    sha256 cellar: :any_skip_relocation, catalina:     "5895308f0a3548427de4a0ad77cf37ba2f84aa12478180185099c3df6b89ed84"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "080689798e7b370343728ab81d4f484efe74de162f5ad178b523b987b9d044a8"
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
